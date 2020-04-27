package com.soldier.common.annotation;

import com.soldier.common.aspect.PreventStrategy;

import java.lang.annotation.*;

/**
 * @Author soldier
 * @Date 20-4-27 下午5:35
 * @Email:583406411@qq.com
 * @Version 1.0
 * @Description:自定义的API接口限流防刷注解
 * 使用：
 * 在相应需要防刷的方法上加上该注解，即可
 */
@Documented
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Prevent {

    /**
     * 限制的时间值（秒）
     */
    int value() default 60;

    /**
     * 限制次数
     */
    int frequency() default 10;

    /**
     * 提示
     */
    String message() default "";

    /**
     * 策略
     */
    PreventStrategy strategy() default PreventStrategy.DEFAULT;
}
