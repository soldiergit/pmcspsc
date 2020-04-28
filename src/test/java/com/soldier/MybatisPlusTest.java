package com.soldier;

import com.soldier.modules.pmcspsc.entity.PmItemInfoRetreatEntity;
import com.soldier.modules.pmcspsc.service.PmItemInfoRetreatService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @Author soldier
 * @Date 20-4-28 上午7:09
 * @Email:583406411@qq.com
 * @Version 1.0
 * @Description:测试MybatisPlus的接口
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class MybatisPlusTest {

    @Autowired
    private PmItemInfoRetreatService pmItemInfoRetreatService;

    /**
     * 结论：save之后会将数据库中的id返回到实体类中
     */
    @Test
    public void testSave() {
        PmItemInfoRetreatEntity pmItemInfoRetreatEntity = new PmItemInfoRetreatEntity();
        pmItemInfoRetreatEntity.setItemInfoId(2);
        pmItemInfoRetreatEntity.setRetreatAdvise("测试save后是否返回主键");
        pmItemInfoRetreatEntity.setRetreatIsDel(0);

        boolean save = pmItemInfoRetreatService.save(pmItemInfoRetreatEntity);

        System.out.println("save status : "+save);

        System.out.println(pmItemInfoRetreatEntity.toString());
    }
}
