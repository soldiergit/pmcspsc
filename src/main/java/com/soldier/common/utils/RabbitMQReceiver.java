package com.soldier.common.utils;

import com.google.gson.Gson;
import com.soldier.config.RabbitMQConfig;
import com.soldier.modules.pmcspsc.entity.PmFinishInfoEntity;
import com.soldier.modules.pmcspsc.service.PmFinishInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author soldier
 * @Date 20-4-27 下午7:35
 * @Email:583406411@qq.com
 * @Version 1.0
 * @Description:消息消费者-以项目结题为例
 */
@Service
public class RabbitMQReceiver {

    private static Logger logger = LoggerFactory.getLogger(RabbitMQReceiver.class);

    private final static Gson gson = new Gson();

    @Autowired
    private PmFinishInfoService pmFinishInfoService;

    @Autowired
    private RedisUtils redisUtils;

    /**
     * 请求出队，生产立项信息   其它几步在PmItemInfoController.class
     * Direct模式 交换机Exchange
     */
    @RabbitListener(queues = RabbitMQConfig.QUEUE_NAME)
    public void receiver(String message) {
        logger.info("RabbitMQ==>项目结题业务请求出队，执行中...:"+message);

        PmFinishInfoEntity pmFinishInfo = gson.fromJson(message, PmFinishInfoEntity.class);

        boolean save = pmFinishInfoService.save(pmFinishInfo);

        // 将保存结果保存到redis中，因为轮询时间不会很久，使用设置key的默认过期时间为10分钟
        String key = RabbitMQConfig.REDIS_KEY + pmFinishInfo.getUserId() +","+pmFinishInfo.getItemInfoId();
        redisUtils.set(key, save, 60 * 10);
    }
}
