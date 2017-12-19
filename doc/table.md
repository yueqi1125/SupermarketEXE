用户表
	用户ID(key)
	用户名
	用户性别
	用户密码
	用户的存储金额
	用户积分
	用户会员等级（默认0，最高5）//普通（0积分）、白银（200积分）、黄金（1000积分）、钻石（5000积分）
	
create table user(
user_ID char(15) primary key,
user_Name char(10),
user_Gender char(1),
user_Password char(64),
user_Money decimal(18,2) DEFAULT '0.00',
user_Integral int(10),
user_Level char(2)
);

insert into user values('201709020000','user','男',password('123456'),0,0,'普通');

管理员表
	管理员ID(key)
	管理员名
	管理员性别
	管理员年龄
	管理员权限（收银员，管理员，老板）
	管理员密码（默认密码为123456）
	
默认管理员
	管理员ID：2017090200
	管理员名：adms
	管理员性别：男
	管理员年龄：20
	管理员权限：老板
	密码：123456
	
create table admin(
admin_ID char(10) primary key,
admin_Name char(10),
admin_Gender char(1),
admin_Age int(3),
admin_Level char(10),
admin_Password char(64)
);

insert into admin values('2017090200','adms','男',20,'老板',password('123456'));

商品表
	商品ID(key)
	商品名称
	商品种类
	商品进货价格（数据结构错误）
	商品出售价格（数据结构错误）
	商品数量
	商品上架信息（0为上架，1为下架）
	
create table goods(
good_ID char(10) primary key,
good_Name char(10),
good_Kind char(10),
good_Pricein decimal(18,2) DEFAULT '0.00',
good_Priceout decimal(18,2) DEFAULT '0.00',
good_No int(10),
good_Info int(1)
);

商品变动信息
	信息编号(key)
	商品ID(key)
	商品名称
	商品种类
	商品进货价格（数据结构错误）
	商品出售价格（数据结构错误）
	商品变动数量
	商品变动类型（进货、出售）
	金额变动数量
	商品进货时间
	操作对象
	
create table goods_Info(
info_ID char(10) primary key,
good_ID char(10),
good_Name char(10),
good_Kind char(10),
good_Pricein decimal(18,2) DEFAULT '0.00',
good_Priceout decimal(18,2) DEFAULT '0.00',
good_No int(10),
info_kind char(2),
good_Money decimal(18,2) DEFAULT '0.00',
info_time date,
user_ID char(15)
);

财务表
	账目日期(key)
	进货总金额
	出售总金额
	出售总利润
	资产变动金额
	
create table money(
money_date char(16) primary key,
money_Spend decimal(18,2) DEFAULT '0.00',
money_Income decimal(18,2) DEFAULT '0.00',
money_Profit decimal(18,2) DEFAULT '0.00',
money_Change decimal(18,2) DEFAULT '0.00'
);

收银商品表
	批次
	商品ID
	商品名称
	商品种类
	商品价格
	购买数量
	总金额
	
create table user_goods( 
Pro_batches char(3) primary key,
good_ID char(10),
good_Name char(10),
good_Kind char(10),
good_Price decimal(18,2) DEFAULT '0.00',
buy_No int(10),
Money decimal(18,2) DEFAULT '0.00'
);