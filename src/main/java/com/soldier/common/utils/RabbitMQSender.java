package com.soldier.common.utils;

import com.google.gson.Gson;
import com.soldier.config.RabbitMQConfig;
import com.soldier.modules.pmcspsc.entity.PmFinishInfoEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author soldier
 * @Date 20-4-27 下午7:35
 * @Email:583406411@qq.com
 * @Version 1.0
 * @Description:消息生产者-以项目结题为例
 */
@Service
public class RabbitMQSender {

    private static Logger logger = LoggerFactory.getLogger(RabbitMQSender.class);

    private final static Gson gson = new Gson();

    @Autowired
    private AmqpTemplate amqpTemplate;

    /**
     * 请求入队(消息队列)，立即返回信息：“排队中”
     */
    public void sendMessage(PmFinishInfoEntity pmFinishInfo) {

        String message = gson.toJson(pmFinishInfo);

        logger.info("RabbitMQ==>项目结题业务请求入队："+message);

        amqpTemplate.convertAndSend(RabbitMQConfig.QUEUE_NAME, message);
    }
}
