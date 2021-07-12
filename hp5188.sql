SET NAMES utf8;
DROP DATABASE  if EXISTS hp5188;
CREATE database hp5188 charset=utf8;
USE hp5188;
/*用户*/
CREATE TABLE user_mes(                      
    uid INT PRIMARY KEY AUTO_INCREMENT ,    /*用户ID*/
    uname VARCHAR(32) ,    /*用户名*/
    upwd VARCHAR(32)             /*密码*/
);
insert into user_mes values(null,'zs','123456');

/*地址*/
CREATE TABLE user_address(
	aid INT PRIMARY KEY AUTO_INCREMENT ,
    aname VARCHAR(32),                      /*收件人姓名*/
    aphone VARCHAR(32),                     /*收件人手机号*/
    province varchar(32),                   /*省*/
    town VARCHAR(64),                       /*市*/
    county VARCHAR(64),                     /*县*/
    details varchar(128),                   /*具体*/
    uid int,                                /*具体账户的地址*/
	FOREIGN KEY(uid) REFERENCES user_mes(uid) 
);
/*订单*/
CREATE TABLE user_order(
    oid INT PRIMARY KEY AUTO_INCREMENT ,
    num VARCHAR(32),                        /*订单编号*/
    deal VARCHAR(32),                       /*交易编号*/
    aid INT,                                /*地址id*/
    FOREIGN KEY(aid) REFERENCES user_address(aid)
);
/*购物车*/
CREATE TABLE user_shop(
    sid INT PRIMARY KEY AUTO_INCREMENT ,
    stit varchar(256) ,                     /*标题*/
    pnum int                               /*产品数量*/
);

/**********************************************************************/

/*产品大类*/
CREATE TABLE bkind(
    kid int PRIMARY KEY  AUTO_INCREMENT ,
    kname VARCHAR(64)                     /*类型*/
);
insert into bkind values(null,'PS4');
insert into bkind values(null,'PS5');
insert into bkind values(null,'XSX');
insert into bkind values(null,'XBOX ONE');
insert into bkind values(null,'NS');

/*产品小类*/
CREATE TABLE skind(
    sid int PRIMARY KEY AUTO_INCREMENT,
    /*1.角色扮演 2、VR 3、策略 4、射击 5、动作 6、格斗 7、竞速 8、模拟 9、音乐 11、休闲益智 12、体育 13、体感 14、其他*/
    skinds int,                             /*游戏种类*/
    chs tinyint(1),                         /*是否支持中文*/
    eng tinyint(1),                         /*是否支持英文*/
    jpn tinyint(1),                         /*是否支持日文*/
    cd tinyint(1),                         /*是否为光驱版*/
    simg VARCHAR(64),                       /*图片地址*/
    kid INT ,                               /*连接类型*/
    FOREIGN KEY(kid) REFERENCES bkind(kid)
);
insert into skind values(null,1,1,"./PS4/1.png",1);

/*首页轮播图*/
CREATE TABLE home(                          
    kid int PRIMARY KEY AUTO_INCREMENT,     /*ID*/
    kname varchar(256),                     /*标题*/
    klink VARCHAR(64),                      /*链接*/
    pic VARCHAR(64)                         /*图片*/
);