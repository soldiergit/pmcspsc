大学生专业学科竞赛项目过程管理系统  -后台
 ============================  
#### 项目说明
pmcspsc

#### _2019年秋季大三第一学期，JAVAEE期末课设_
技术要求：spring boot，spring mvc，mybatis，mybatis plus

#### 构建项目
1. idea自带数据库管理工具导入方式
创建pmcspsc数据库命令：
CREATE SCHEMA pmcspsc DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
2. maven引入jar包
选择maven 中的install
3. 运行PMCSPSCApplication

#### 部署项目
1. 生成docker镜像：docker build -t soldierdocker/pmcspsc:v1.0.0 .
2. 推镜像：docker push soldierdocker/pmcspsc
3. 拉镜像：docker pull soldierdocker/pmcspsc:v1.0.0
4. 启动容器：docker run -d -p 8080:8080 soldierdocker/pmcspsc:v1.0.0
<br> 
   <ul>
      <li>
        <h2>某大学拟开发一套大学生专业学科竞赛项目过程管理系统,实现全校专业学科竞赛项目从立项到结题的过程管理其需求描述如下:</h2>
      </li>
      <li>
        <h2>(一)项目立项过程:</h2></li>
        <li>
          <h3>1)填写项目立项申请</h3>
          二级学院作为组赛单位报送每年专业学科竞赛项目。组赛单位的指导老师每年在线填写参加专业学科『竞赛项目立项申请信息』,
          然后从系统导出并打印项目立项申请书,将签字盖章后的项目立项申请书扫描为PDF文档并作为佐证附件上传到系统,
          最后将立项申请提交给教务处实验实践科审核。『项目立项申请信息』分为项目基本信息和经费预算信息两部分,
          其中项目基本信息包括赛事名称、组赛单位、赛制(单人赛、团队赛)、项目负责人、联系电话、电子邮件、竞赛起始日期、
          竞赛结束日期、专业、竞赛主办单位、竞赛承办单位、申请立项日期、论证组赛的目的和意义、竞赛邀请函或通知附件;
        </li>
      <li>
        <h4>经费预算表</h4>
        <table>
          <tr>
            <th>参赛注册费</th>
            <th>差旅费</th>
            <th>培训费</th>
            <th>指导费</th>
            <th>耗材费</th>
            <th>教师奖金</th>
            <th>其它</th>
            <th>合计</th>
          </tr>
          <tr>
            <td>0</td>
            <td>5000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>7000</td>
          </tr>
        </table>
      </li>
      <li>
        <h3>2)审核项目立项申请</h3>教务处实验实践科工作人员可以在线审核项目立项申请内容。
        如果审核不通过,需填写审核意见并回退给指导老师。指导老师可以删除自己的项目立项申请,但是不能删除已经审核通过的立项申请。
      </li>
      <li>
        <h2>(二)填写报名过程:</h2>报名参赛方式分为个人赛和团队赛,指导老师填写参赛报名信息。
        参赛报名信息分为团队信息和团队成员信息,团队信息包括团队编号、项目编号、赛题、报名时间等,
        团队成员信息包括编号、团队编号、学号、姓名、学院、班级、年级、专业、邮箱、手机号等。
      </li>
      <li>
        <h2>(三)项目结题过程</h2>
        <h3>1)填写项目结题申请</h3>比赛结束后,指导老师需在线填写各参赛队伍的获奖情况和资金实际使用情况,并上传结题报告书 PDF 扫描件。
        获奖情况包括获奖名次(特等奖、一等奖、二等奖、三等奖、优秀奖、无)和级别(国家级、区级等);
      </li>
      <li><table>
      <tr>
        <th>参赛注册费</th>
        <th>差旅费</th>
        <th>培训费</th>
        <th>评审费</th>
        <th>指导费</th>
        <th>领队费</th>
        <th>组织费</th>
        <th>奖金</th>
        <th>耗材费</th>
        <th>合计</th>
      </tr>
        <tr>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>1000</td>
          <td>0</td>
          <td>1000</td>
      </tr>
      </table></li>
      <li>
        2)审核项目结题申请。教务处实验实践科工作人员审核结题申请内容,并填写审核意见。
        如果申请内容有问题则结题申请退回给组赛的指导老师,经组赛指导老师修改后重新提交。
        教务处实验实践科工作人员可以统计竞赛立项情况、获奖情况。
      </li>
    </ul>
<br>

## `2020.04.27重构`
### `使用RabbitMQ消息中间件`
#### RabbitMQ的安装
1. 下载[Erlang](https://www.rabbitmq.com/releases/erlang/)<br>
2. 下载[RabbitMQ](https://www.rabbitmq.com/releases/rabbitmq-server/)<br>
3. 根据系统版本下载[socat](http://repo.iotti.biz/CentOS/)<br>
```C
查看系统版本信息：lsb_release -a
```
4. 分别安装Erlang、Socat、RabbitMQ（一定按照顺序！）<br>
```C
wget https://www.rabbitmq.com/releases/erlang/erlang-19.0.4-1.el7.centos.x86_64.rpm
wget https://www.rabbitmq.com/releases/rabbitmq-server/v3.6.15/rabbitmq-server-3.6.15-1.el6.noarch.rpm
wget http://repo.iotti.biz/CentOS/7/x86_64/socat-1.7.3.2-5.el7.lux.x86_64.rpm
rpm -ivh erlang-19.0.4-1.el7.centos.x86_64.rpm
rpm -ivh socat-1.7.3.2-5.el7.lux.x86_64.rpm
rpm -ivh rabbitmq-server-3.6.15-1.el6.noarch.rpm
```
5. 配置rabbitmq<br>
```C
vi /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.15/ebin/rabbit.app
将 {loopback_users, [<<"guest">>]} 改为 {loopback_users, []}
```
6. 安装管理插件：rabbitmq-plugins enable rabbitmq_management<br>
7. 启动RabbitMQ，然后访问IP:5672/，默认用户名密码：guest即可查看<br>
```C
cd /usr/lib/rabbitmq/bin
./rabbitmq-server start
```
#### RabbitMQ的配置
[SpringBoot + RabbitMQ配置参数解释](https://www.cnblogs.com/qts-hope/p/11242559.html)

### `安全优化`
#### 接口的限流防刷
自定义Prevent注解，可以使用拦截器减少对业务的侵入
```C
总结：
定义一切面，通过@Prevent注解作为切入点、在该切面的前置通知获取该方法的所有入参并将其Base64编码，
项目名称 + 完整方法名作为redis的key + 用户id，访问次数作为reids的value，
Prevent的value作为redis的expire，存入redis；
每次进来这个切面根据key判断redis值是否存在，不存在则设value为1且允许调用；存在则判断是否超过frequency，不超过自增；超出拦截防刷
```