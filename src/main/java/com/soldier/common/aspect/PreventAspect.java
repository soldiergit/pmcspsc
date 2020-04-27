package com.soldier.common.aspect;

import com.alibaba.fastjson.JSON;
import com.soldier.common.annotation.Prevent;
import com.soldier.common.exception.RRException;
import com.soldier.common.utils.RedisUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.lang.reflect.Method;
import java.util.Base64;

/**
 * @Author soldier
 * @Date 20-4-27 下午5:44
 * @Email:583406411@qq.com
 * @Version 1.0
 * @Description:防刷切面实现类
 * 定义一切面，通过@Prevent注解作为切入点、在该切面的前置通知获取该方法的所有入参并将其Base64编码，
 * 项目名称 + 完整方法名作为redis的key + 用户id，访问次数作为reids的value，
 * Prevent的value作为redis的expire，存入redis；
 * 每次进来这个切面根据key判断redis值是否存在，不存在则设value为1且允许调用；存在则判断是否超过frequency，不超过自增；超出拦截防刷
 */
@Aspect
@Component
public class PreventAspect {

    private static Logger log = LoggerFactory.getLogger(PreventAspect.class);

    @Autowired
    private RedisUtils redisUtils;


    /**
     * 切入点
     */
    @Pointcut("@annotation(com.soldier.common.annotation.Prevent)")
    public void pointcut() {
    }


    /**
     * 处理前
     */
    @Before("pointcut()")
    public void joinPoint(JoinPoint joinPoint) throws Exception {

        String requestStr = JSON.toJSONString(joinPoint.getArgs()[0]);
        if (StringUtils.isEmpty(requestStr) || requestStr.equalsIgnoreCase("{}")) {
            throw new RRException("[防刷]入参不允许为空");
        }

        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = joinPoint.getTarget().getClass().getMethod(methodSignature.getName(),
                methodSignature.getParameterTypes());

        Prevent preventAnnotation = method.getAnnotation(Prevent.class);
        String methodFullName = method.getDeclaringClass().getName() + method.getName();

        entrance(preventAnnotation, requestStr, methodFullName);
        return ;
    }


    /**
     * 入口
     *
     * @param prevent
     * @param requestStr
     */
    private void entrance(Prevent prevent, String requestStr, String methodFullName) throws Exception {
        PreventStrategy strategy = prevent.strategy();
        switch (strategy) {
            case DEFAULT:
                defaultHandle(requestStr, prevent, methodFullName);
                break;
            default:
                throw new RRException("无效的策略");
        }
    }


    /**
     * 默认处理方式
     */
    private void defaultHandle(String requestStr, Prevent prevent, String methodFullName) throws Exception {

//        String base64Str = toBase64String(requestStr);
        long expire = prevent.value();
        int frequency = prevent.frequency();

//        String key = "project:pmcspsc-(Prevent)-"+methodFullName + base64Str;
        String key = "project:pmcspsc-(Prevent)-"+methodFullName;
        Integer resp = redisUtils.get(key, Integer.class);
        //第一次访问
        if (StringUtils.isEmpty(resp)) {
            redisUtils.set(key, 1, expire);
        } else if (resp < frequency){
            // 不是第一次访问 访问次数加1
            redisUtils.incr(key);
        } else {
            String message = !StringUtils.isEmpty(prevent.message()) ? prevent.message() :
                    expire + "秒内只允许重复调"+frequency+"次";
            throw new RRException(message);
        }
    }


    /**
     * 对象转换为base64字符串
     *
     * @param obj 对象值
     * @return base64字符串
     */
    private String toBase64String(String obj) throws Exception {
        if (StringUtils.isEmpty(obj)) {
            return null;
        }
        Base64.Encoder encoder = Base64.getEncoder();
        byte[] bytes = obj.getBytes("UTF-8");
        return encoder.encodeToString(bytes);
    }
}
