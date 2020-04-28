package com.soldier.config;

import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Author soldier
 * @Date 20-4-27 下午7:33
 * @Email:583406411@qq.com
 * @Version 1.0
 * @Description:创建队列
 */
@Configuration
public class RabbitMQConfig {

    public static final String QUEUE_NAME = "project:pmcspsc.finish.queue";

    public static final String REDIS_KEY = "project:pmcspsc-(rabbitmq)-finish--userId,itemInfoId:";

    /**
     * Direct模式 交换机Exchange
     */
    @Bean
    public Queue queue() {
        return new Queue(QUEUE_NAME, true);
    }

}
