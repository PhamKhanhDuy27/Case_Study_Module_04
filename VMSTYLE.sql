create database CASE_STUDY_04;
use CASE_STUDY_04;
create TABLE CATEGORY(
ID BIGINT NOT NULL PRIMARY KEY auto_increment,
NAME VARCHAR(50) NOT NULL,
PARENT_ID BIGINT,
CONSTRAINT FK1 FOREIGN KEY (PARENT_ID) REFERENCES CATEGORY(ID)
);
CREATE TABLE PRODUCT(
ID BIGINT NOT NULL PRIMARY KEY auto_increment,
NAME VARCHAR(1000) NOT NULL,
PRICE BIGINT NOT NULL,
QUANTITY BIGINT NOT NULL,
CATEGORY_ID BIGINT,
CONSTRAINT FK2 FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(ID)
);
CREATE TABLE IMAGE(
ID BIGINT NOT NULL PRIMARY KEY auto_increment,
URL VARCHAR(1000) NOT NULL,
PRODUCT_ID BIGINT,
CONSTRAINT FK3 FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID)
);
CREATE TABLE USERS(
ID BIGINT NOT NULL PRIMARY KEY auto_increment,
NAME VARCHAR(50) NOT NULL,
PHONE_NUMBER VARCHAR(20) NOT NULL unique,
EMAIL VARCHAR(100),
PASSWORD VARCHAR(100),
ROLE ENUM ('ADMIN', 'USER')
);
CREATE TABLE CART(
ID BIGINT NOT NULL primary KEY auto_increment,
TOTAL BIGINT,
USER_ID BIGINT,
CONSTRAINT FK6 FOREIGN KEY (USER_ID) REFERENCES USERS(ID)
);
CREATE TABLE CART_LINE(
ID BIGINT NOT NULL PRIMARY KEY auto_increment,
PRODUCT_ID BIGINT,
QUANTITY BIGINT,
SUBTOTAL BIGINT,
CART_ID BIGINT,
CONSTRAINT FK7 FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID),
CONSTRAINT FK8 FOREIGN KEY (CART_ID) REFERENCES CART(ID)
);
CREATE TABLE ORDERS(
ID BIGINT NOT NULL PRIMARY KEY auto_increment,
TOTAL BIGINT,
TIME_ORDER timestamp,
USER_ID BIGINT,
CONSTRAINT FK9 FOREIGN KEY (USER_ID) REFERENCES USERS(ID)
);
CREATE TABLE ORDER_LINE(
ID BIGINT NOT NULL PRIMARY KEY auto_increment,
SUBTOTAL BIGINT,
ORDER_ID BIGINT,
CONSTRAINT FK11 FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ID)
);
INSERT INTO `case_study_04`.`category` (`NAME`) VALUES ('NỮ');
INSERT INTO `case_study_04`.`category` (`NAME`) VALUES ('NAM');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ĐẦM', '1');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO', '1');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('QUẦN', '1');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('CHÂN VÁY', '1');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ĐỒ BỘ', '1');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('UNDERWEAR', '1');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('JUMPSUIT-SET', '7');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO', '2');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('QUẦN', '2');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ĐẦM KIỂU', '3');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ĐẦM THUN', '3');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO KIỂU', '4');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO SƠ MI', '4');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO THUN', '4');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO LEN', '4');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO KHOÁC', '4');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('QUẦN SHORT', '5');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('QUẦN LỬNG', '5');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('QUẦN DÀI', '5');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('CHÂN VÁY NGẮN', '6');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('CHÂN VÁY DÀI', '6');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('QUẦN VÁY', '6');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ĐỒ BỘ DÀI', '7');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ĐỒ BỘ NGẮN', '7');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('BRA', '8');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO SƠ MI', '10');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO THUN', '10');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO LEN', '10');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('ÁO KHOÁC', '10');
INSERT INTO `case_study_04`.`category` (`NAME`, `PARENT_ID`) VALUES ('QUẦN DÀI', '11');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Đầm midi voan 2 dây bèo ngực nữ tính, thanh lịch', '339000', '50', '12');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Đầm nữ tay dài phồng công chúa cổ trụ bánh bèo', '375000', '50', '12');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Đầm cúp ngực cổ hoa bèo thướt tha tiểu thư', '349000', '50', '12');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Đầm thun polo nữ tay phồng dáng ngắn 3 nút hoa', '279000', '50', '13');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Đầm dài thun ôm body đơn giản trễ vai sexy, quyến rũ', '249000', '50', '13');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Đầm thun nữ TN trơn đơn giản thoải mái mát mẻ', '219000', '50', '13');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo voan cổ yếm hoa nhí croptop xếp tầng', '189000', '50', '14');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo kiểu nữ tay dài baby doll cổ tròn', '245000', '50', '14');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo tiểu thư tay dài phối bèo nữ tính', '225000', '50', '14');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Sơ mi trơn tay dài cổ bẻ đi học đi làm đi chơi siêu thanh lịch', '245000', '50', '15');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo sơ mi tay dài 2 nắp túi form rộng nặng động trẻ trung', '225000', '50', '15');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Sơ mi tay dài croptop hình bên túi', '189000', '50', '15');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo thun nữ cổ trong sọc ngang đơn giản', '195000', '50', '16');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo croptop form ôm có cổ dây khóa kéo cá tính, trẻ trung', '175000', '50', '16');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo thun nữ baby tee tay ngắn rút dây cá tính, quyến rũ', '179000', '50', '16');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo len tay dài cardigan phối 2 màu có túi dạng lưới', '195000', '50', '17');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo len nữ croptop trơn đơn giản cổ viền màu', '175000', '50', '17');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo len 2 dây bảng to basic, đơn giản kiểu dáng ôm gọn quyến rũ', '109000', '50', '17');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo khoác vest blazer 2 túi nắp thanh lịch, công sở', '349000', '50', '18');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo khoác vest nữ tay dài dáng croptop có túi', '325000', '50', '18');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo khoác jean có 2 túi nắp đơn giản cá tính', '229000', '50', '18');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần short nữ nhung trơn cơ bản', '219000', '50', '19');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần short tây nữ trơn xếp ly cơ bản', '185000', '50', '19');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần jean short ngố trơn basic có túi trước kiểu', '149000', '50', '19');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần jean lửng dáng ôm tôn dáng', '149000', '50', '20');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Jean lửng ngố lưng kiểu thường', '139000', '50', '20');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần tây nữ ống rộng lưng cao tôn dáng có thắt dây hông', '279000', '50', '21');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần jean nữ ống loe lai giữa tôn dáng jean cao cấp', '249000', '50', '21');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần thể thao jogger nữ chun bo gối đơn giản, năng động', '195000', '50', '21');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Chân váy ngắn jean phối túi cá tính, quyến rũ', '345000', '50', '22');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Chân váy ngắn 2 tầng đuôi cá chất kaki tôn dáng, hack chiều cao', '219000', '50', '22');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Chân váy nhung ngắn xếp ly cạp cao dáng xòe', '205000', '50', '22');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Chân váy jean dài xẻ trước', '325000', '50', '23');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Chân váy dài xếp li nữ tính (Có lưng chun co giãn)', '229000', '50', '23');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Chân váy kaki ôm dài đai kiểu', '195000', '50', '23');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần chân váy dạ ngắn dáng chữ A trơn', '189000', '50', '24');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần váy dáng ngắn form chữ A 2 túi nắp kiểu', '155000', '50', '24');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Đồ bộ tay ngắn cổ vest 1 túi + quần dài', '219000', '50', '25');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Đồ bộ áo tay ngắn cổ vest 1 túi + quần ngắn', '129000', '50', '26');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Đồ bộ xốp áo tay ngắn + quần ngắn kimono', '189000', '50', '26');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo 2 dây viền cúp ngực bra thun tăm co giãn tốt', '85000', '50', '27');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo bra 2 dây cổ V bảng to', '79000', '50', '27');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo bra thun tăm 2 dây', '59000', '50', '27');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Set áo tay ngắn thắt dây áo + chân váy dài thanh lịch, tiểu thư', '375000', '50', '9');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Set áo sơ mi croptop tay ngắn cổ vest + quần váy kiểu', '325000', '50', '9');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Set áo yếm kèm quần đùi cá tính, năng động', '229000', '50', '9');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Sơ mi tay dài trơn đơn giản', '379000', '50', '28');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Sơ mi tay ngắn thêu đơn giản', '379000', '50', '28');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Sơ mi nam phối màu thêu chữ trẻ trung', '349000', '50', '28');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo thun tay ngắn in hình mũi tên', '349000', '50', '29');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo thun tay ngắn phối màu in ADVENTURE', '289000', '50', '29');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo thun T-shirt nam tay ngắn in ADER', '189000', '50', '29');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo len nam tay dài kẻ sọc màu đơn giãn, lịch lãm', '395000', '50', '30');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Áo khoác bomber nam chất kaki nhung mịn có lót dù', '279000', '50', '31');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần kaki trơn lai thường', '379000', '50', '32');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần tây nam trơn lai thường đơn giản, thanh lịch', '419000', '50', '32');
INSERT INTO `case_study_04`.`product` (`NAME`, `PRICE`, `QUANTITY`, `CATEGORY_ID`) VALUES ('Quần dài tây nam ô caro lịch lãm, sang trọng', '389000', '50', '32');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=0938a98d-e20c-4391-a9c2-38ba454a55dc', '1');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9ed123f7-a373-4781-8e19-317294e3dbcb', '1');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e6c10c34-fa02-4a19-a325-5534184ac272', '1');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f32ea3c2-2d31-40c9-9990-9490876d6cba', '1');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=529be198-f39f-4e33-b986-7333ddf9bc89', '1');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=68b8f10e-167e-4c23-9ab6-528ed5809fe5', '2');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=46e2391b-661b-4acf-9820-c3a70defbf7b', '2');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d37ad77f-c224-4126-b7c5-b6012716de0f', '2');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=52271e3e-1b5f-467e-813f-605c37475bd6', '2');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=55f5d692-be91-4bfd-af9b-364616da8119', '2');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=16aab715-fe30-4d90-af35-7da110cfbbd7', '3');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=5b81bc3e-a179-4bb1-85ab-de6e3dc94baa', '3');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=2a19ed2f-ada2-4190-ab3c-b829ee3f779a', '3');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9c09f88e-637c-4d1a-9a70-d3a2f3a19198', '3');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=b7d5e6cf-cfc7-4001-b285-14329eb6c694', '3');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=5272a469-0325-4798-ab95-291f825676d6', '4');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=bb9ae64d-7d43-4d82-ba3f-77232fe1f491', '4');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=b9cf3619-9cb8-49f2-a4d5-e2e4bd423812', '4');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f1ca4344-2dff-488e-9b14-9fb91862f2b3', '4');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d9c0466a-6bd1-4744-8971-82ab54ed8118', '4');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=fa7ee52d-4113-4aa9-b40d-b2016836e445', '5');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=1fd7f933-95db-411f-8bd0-86637bdf4f2a', '5');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=c896025f-e66f-43a5-a64b-2862414aec9f', '5');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=58e81fc3-df0d-4c81-af9e-af383fd0452e', '5');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7bcda8ba-47ca-4539-8dea-be817bdc0154', '5');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=0eb086ba-f07d-4d51-80e8-8e7b2f51510b', '6');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3d61ad57-1bc7-4aab-9177-6fec09ebccdf', '6');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e2852bef-5152-4051-97ae-0b43c595c4a1', '6');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7aacc7ef-4635-46d2-bfea-7729ec191af7', '6');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=40569de3-51cc-47c0-8ea3-dbe5303efef0', '6');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=a5ee7055-4079-469b-b2ce-a7c02d6d0e7e', '7');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=bf1ee087-5935-4380-95f6-dbc6b7a93fdd', '7');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=afe0e0f3-d5e7-4782-90ca-ebd1c9b348bf', '7');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=af6f5343-be1d-41a6-8154-cc3ddb9b4e77', '7');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=aa4d36b2-6d3e-4219-9e3f-4287c8ce2cdc', '7');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=682d4abd-123c-4863-a922-edb352dd00cc', '8');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=55451974-87d1-43d9-bd41-e57c4adf025b', '8');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=68b63cd2-43de-403c-a46e-6b3e9a965720', '8');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=b6dc8653-22c0-4cb8-8e53-d975b1a1984a', '8');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=34f5a40d-8db7-411e-b6bb-50c49769bc60', '8');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=2d5665d9-a317-4e54-b6a8-21f1fe4a0e2d', '9');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=0fa40606-5535-4347-bef2-376d72dcf86e', '9');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=a76fbfe4-186e-414e-85e0-5eb783c00744', '9');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=6e7229f8-c211-41d9-9098-b3675b32962a', '9');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=4ee0af2a-c420-4cd1-9c08-0df6606db384', '9');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3c0293f7-ebeb-4f4a-9d59-ef4d47acd3fa', '10');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=83003603-62ad-4740-a5b5-dde4f7de7ae3', '10');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=5d8c00bf-60a3-4ea9-8ffc-957fa07852f4', '10');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=cf11887c-9140-4a60-a50c-f310b9912a7d', '10');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=cb3a513c-03e0-4124-a0cd-21d3bc664db3', '10');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=5b2ab118-b5a2-485d-b11d-be409f5930b3', '11');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d12a1703-9130-4a0d-a026-c476d6137c2d', '11');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f4f27d29-5d61-4290-a829-98013774f93a', '11');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f7a2fcd1-5845-43d3-8f9e-c5d7576884d4', '11');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=b24c90c7-a7a5-4347-8de0-a58df9f2a168', '11');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=1be451af-0ee8-4719-80da-02eeb48c7f1d', '12');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3790bd3a-4b1e-455f-8d0b-b52ddbef4484', '12');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=76d97c89-12f1-4869-84ea-1c0a87e093db', '12');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=49a80d1a-6773-4208-aa6d-5439a6ccfae5', '12');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=bbd80f8d-18c0-40dd-ba09-ffa375896e3f', '12');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=aea4ca30-91d0-4613-affc-f537f062515f', '13');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=325ac600-df7a-4730-90a8-4cfcf044a17b', '13');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f8cdf75b-d7ae-43e5-ae4a-7b33b4ed0324', '13');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=2a279110-3674-4394-9aa6-1fefa351eca0', '13');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9aa9f454-1720-4a26-8245-14131d4330c5', '13');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=500b2ed3-8f34-42a0-b76a-692c72e26ca8', '14');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=cdde42c7-e0c4-4d1a-9b3c-bcbc63bb28df', '14');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=796eb6f8-672d-4361-a965-f37e2aa8a1a3', '14');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=a1264a88-ea46-4f70-923a-46143ad716aa', '14');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=c3fb94ff-0637-42d8-9c06-9a7a4b3c8c05', '14');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=46014036-6fa4-469a-bf71-ebb0997154b4', '15');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=61295617-dfbf-45c3-8b33-c3c780229477', '15');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=6a87d913-46f6-4e87-b168-3b24a6ea973f', '15');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=81f3d795-512b-4043-8a4b-ca86e1f8ec51', '15');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=eba3a55f-dce0-4bcc-9169-0309304cf73d', '15');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=6e70c812-b0e6-44d9-8c7c-88a9ac70ad18', '16');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=4ab83776-5047-4ec3-807a-0b7fdcee2090', '16');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=bb56dc99-c8df-4f69-bdc8-aa6db96594e4', '16');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=44601141-fd19-406d-8571-ea219b65d8b0', '16');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3661ab0a-23c7-46f0-ae2b-9c8e6ed084fb', '16');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=0e26c43c-6322-43e8-a072-439629b036de', '17');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=87ef1ba3-cc4d-40a7-a9f9-efedc925f2cc', '17');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=af8f9505-ef9c-41fc-a5eb-4f001f5c61a8', '17');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7492b096-2a22-46d9-92ad-0638a7eb37a2', '17');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e6f0803a-dbec-4dd1-87f6-a09b2866a43b', '17');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=022aa44e-babc-4f2a-bc7f-9dd62c2a92e6', '18');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=64689c34-c137-4182-9bae-ebc3b6e879de', '18');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e11ef100-296c-4431-9bd9-a006711db447', '18');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=8fdbac6d-8347-409e-b2be-0969adffd3cb', '18');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f47ebbd5-3bd3-4206-b10a-9f98ce9f0a0e', '18');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=bb8a6267-00b7-4ceb-a012-4302cf104be6', '19');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=0c4b277b-bc90-4aaa-b413-3bfc25f7c875', '19');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7bbfe23b-21ab-4473-93b9-17cf3f13b941', '19');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=752e5d56-eb33-4a1c-af7c-d8f6c35474df', '19');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9ac33921-0afd-469f-bfc3-698de820a422', '19');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f0394932-f2d2-41fe-9083-43c6fa518437', '20');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=4fb26be5-e7b2-4a22-8597-04e19b7e14ed', '20');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=50d7101e-b115-4ae1-a064-40f3ccffd099', '20');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e62b8fcc-660d-4c1c-a481-297c60370272', '20');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=c807f30f-2ae4-4181-af14-843de73df42c', '20');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=82808692-a035-419e-9980-7252a7b1e6a6', '21');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=67d9cd23-ff4c-47e6-9e30-96e07bd271a4', '21');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=20ebc951-1ac6-489e-b21c-c1772805b04a', '21');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=0e043e97-0276-441d-98e5-8db1cae2ebce', '21');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=fb69bbc2-809d-4ef8-97d5-1fecf5d090a2', '21');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=0633664a-d9b3-4119-992b-f183ad081776', '22');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=8c8f9f89-fa5f-4249-9b0f-fbb034135023', '22');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=22fc622c-db9e-4ccd-948f-f8cad8f6e708', '22');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=532e8a8d-5f6d-4df2-9a32-9d1ba5e59954', '22');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=b9e222b3-8f64-4d00-878a-71388cd40bfa', '22');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=c645691a-da97-4c24-a275-1774edac4c0c', '23');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3ad66ff7-b446-4c21-b80c-e33e7ae1cad6', '23');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7d289bbc-f03e-46a2-917b-e50276104ef1', '23');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=189bfc8a-90a5-4b6a-9331-37307bf23b8c', '23');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=50a1f19e-5662-44c7-996f-8c30197141f9', '23');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e77dbe61-2a3c-4cfd-b7ea-36a95d700a6d', '24');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=70eeddba-d79f-4f7f-ac03-eab9a9637d4b', '24');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9a324a0c-a5f5-44c2-a2bb-715af34422cf', '24');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=ba2c6b51-b7ad-4bf2-9751-3cd4ac4f8b8b', '24');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3adca4a2-76b4-45d9-abce-20b92319272a', '24');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=94688905-8ba9-4d0b-9c5b-adebdc07aa72', '25');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=2bf5dcb3-cf41-4315-845d-5a318a20c99a', '25');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=5b687504-5fa1-4fd8-addf-113577ca63b4', '25');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=446c8b3f-a2fb-4fca-869f-cd8d98140db0', '25');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7af1e4b4-941b-4fdb-8a68-8c17254318c3', '25');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=bf890aa0-fcef-481b-a5fa-43450f0260b4', '26');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=bad9b19f-526a-423f-aa72-7eb5369848cb', '26');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=30bd5ded-1f0d-4665-8871-c29922f04518', '26');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3f0eb8b7-9ceb-4a3e-a031-d41a572ff436', '26');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=61aa1ebe-2191-4f06-8021-5b6719ed2d0b', '26');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=dd038049-9905-40ea-a483-3802d89dd559', '27');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3ab51a9a-255a-4e64-86cb-3f1ad40cad3c', '27');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=13369f2e-8798-48a8-81a7-d4383b13c105', '27');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=083a7111-bcbd-4b23-83d0-c3abb532e35a', '27');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=168ad8ef-a838-4f2b-983e-784979e58b22', '27');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=59710b4c-1dd9-4ef2-ab0f-52eec164ab4d', '28');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=8b6a26c9-5f2c-404d-b489-2a881c11220d', '28');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=68134acf-2e52-4f72-a849-7a15ba44d479', '28');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=0d12d734-f7de-4a1c-8a0b-40b358aab0a3', '28');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=50846b26-acc3-42ec-8579-eddd03a7543a', '28');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=1fe2a6bb-4096-466d-b64a-a43492c7186a', '29');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=21ee9e0d-056e-4156-8e8b-69c6a3ee4eb1', '29');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=a2c3b4b5-fc5c-432f-b1eb-614f82fe528f', '29');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3a0a5296-b2a1-4da0-b23d-01f58f42a274', '29');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=971ce8d8-1251-49a1-8b39-445957d4bdf8', '29');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=bc9d5faf-2c83-463a-bacf-01c71e8f31ed', '30');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=1b9d2fbf-ad07-41c2-a71e-4f2267e9992f', '30');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d0ce6a02-6d27-4635-be3e-7b8495b063bb', '30');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9bc1a99b-e8cf-4565-8613-e4ccf405152a', '30');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e31c45b0-431a-4d8e-b222-992795c0c99f', '30');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=c82ba495-4dcb-42af-925b-b1f79a78163e', '31');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3ba4548c-2df3-4abe-b38c-b039417dc318', '31');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=25667ce7-be55-435e-8bc7-732506d10ac5', '31');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d6ce179e-6e28-4c71-b547-965167a20617', '31');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e7e3f574-460f-4d68-9c86-d2f04b07c3d1', '31');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=56302f19-b1ed-4155-aaff-618081cfcbaa', '32');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=c24ab0a0-6640-4bb5-a5c0-f741c8c32bfc', '32');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=ec56d59c-f234-4278-919f-22d004707a68', '32');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=29520900-35a0-4ccf-8c10-0fb37fbc1bc8', '32');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=ca222eca-7050-44c8-8db5-51bf46d15586', '32');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=2626ebd2-e7b2-4eb5-9f25-6bd8a1954031', '33');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9d72b54a-1a8b-4c16-bd3a-63a153423952', '33');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=db839a62-2ad9-4d11-b8a8-370cf729e4c0', '33');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3a1b5a60-5c95-456d-847a-592259726906', '33');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e730a8fd-bd4e-49b9-978a-693f9c5438c4', '33');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=cbf4c87f-3cca-42e9-a524-1179cb98665c', '34');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=ea1e951a-e8f2-49de-bf30-2ebe99b8c2e7', '34');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e9c186f1-be6b-46c5-8760-24df3f8d532f', '34');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e6554187-a59f-4943-93f2-f9a6d375f695', '34');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=2c4eb254-f705-4c33-ba24-d5ddbc99cc64', '34');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=41d8974d-408b-4d01-b677-1661081ff792', '35');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=14e6f945-e51a-42c6-8ada-fc1bedf6e565', '35');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=880771b0-585e-47d9-a5f8-dbec8f6c7f3c', '35');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=c80ad60c-a668-46fa-abae-57c09f79f483', '35');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=38c2ef54-5262-4b84-8ab3-2c8885fb849b', '35');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e4b42563-1c60-46a5-8a6a-d9074ac6e681', '36');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=cc4a508e-c1be-41e3-bc56-adfc9b9ef5e0', '36');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f77edab1-415e-457f-899e-fdcacca24531', '36');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=1fb12c81-0554-4e7c-bc3b-c4779241da18', '36');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e6078091-dcc2-494a-902b-2bf8d24977d8', '36');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=1619e5fd-a669-4c44-b259-1eb600cfa403', '37');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=97ed641d-7a5c-4f38-b48f-3532c1bf3971', '37');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=afef679e-218c-4e15-a1bb-846620e7f729', '37');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d1be3d99-b8d4-4e47-bb76-f63c44064cd7', '37');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=4fe512b4-d84d-492d-ab47-0ca46d0ec828', '37');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=8629bf85-4987-4b8a-aaef-0e8e8abbc71d', '38');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=c784ca00-8097-4095-b221-2f015cfb69ff', '38');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=84f44004-57ad-4c36-9665-c43a43fdb745', '38');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=5d2f1122-d1d0-498f-b583-d7ead8a9d31c', '38');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=ae0e2e4d-1103-46bc-9657-bf0c078485c6', '38');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=cd43ed10-94fe-49cc-ab65-e92593530610', '39');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=6d6dd8f0-6cb7-47c5-9428-0aa775002726', '39');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=abfd055d-e6e8-45f5-bc72-ed749d20a7f4', '39');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=700ac0bd-61ad-4ec4-a160-9ecb89c67a76', '39');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=1aa8d2f3-78f1-4d7a-af57-9b3e2fa4048d', '39');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=47dd5843-c027-43c1-9e00-18787dcb33b9', '40');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=ef196d92-ccd2-41f8-867a-fb369e5c6a46', '40');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3530bdda-fc65-4493-9d1c-ea3b4a7840b7', '40');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=8bc52aec-929f-47cf-b0ea-85a4870d2e6b', '40');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=283c4d37-bad4-48a8-8566-08f451c594c4', '40');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=caf31732-50aa-4bf7-bc9c-e3dfd3a9baf5', '41');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=87ec5638-223a-402d-bea7-e89cf2e875bf', '41');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=fc42643d-bde4-40a3-a933-3abfb55e629a', '41');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=ccda913b-87ad-4332-a714-12c091df8c99', '41');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e314e386-65e9-4135-9dfd-c993b1f8bae4', '41');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=a80dc264-afcd-4088-86fb-f75df54d466e', '42');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f4469d7e-7398-451f-b1c1-0203bdf4eda0', '42');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d7ebe70f-e247-459f-989d-0d810316336a', '42');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=545ae76a-0bd0-4c59-ab30-da24f1291208', '42');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=b708e62d-27ec-4dd9-8123-dbdd97217a53', '42');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=4569547e-6e93-4d46-a771-009f557954d5', '43');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=95197222-7da6-459c-8919-a86e90358e15', '43');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=cf46db5e-9d04-49da-8903-9c2e117568f1', '43');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f99383ac-8169-47b5-a951-b2b60e2ebc5b', '43');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=c43574eb-ac79-4df9-ae46-87347a5e3fe0', '43');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f343060a-a13b-43b1-a999-dd88d9e02f66', '44');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=622eb766-68d2-46a5-a80e-9fc7387b5663', '44');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=84e68f7e-ffa7-4da0-abec-e00cd2184eea', '44');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=40398870-813d-49db-b280-52628fe18b3d', '44');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=cbf68f38-ed9f-40b8-9e81-ec6cccbc52d6', '44');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=1b646a80-f6bf-4b69-8931-83e271b4c733', '45');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=326dcb0d-6e3b-4228-87a5-3346745e65a8', '45');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7d9e328e-64d3-476f-baed-829c8f0c3e86', '45');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=5cfaa921-94ab-4c81-b64f-95e252aeac93', '45');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7404951f-ee15-47c1-a3bb-6d679ef68e1c', '45');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d014d5f2-9fec-41c0-ac3b-c9a1e50deab1', '46');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=46d7e4e2-9c23-4caf-9350-d9776d78e6b3', '46');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=c9b6c4ff-a304-462c-a025-40016494492c', '46');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=ad5b849f-9bd6-4ca4-b343-dc4481fb4ee2', '46');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=462fe504-819b-4f8c-b22c-29bf5fb37027', '46');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9fb41846-9c03-40c3-846d-c4277a4e5119', '47');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=5feae91b-ad62-4053-9936-f1866cba34b6', '47');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7f7a9994-75e6-48b8-8a55-85f2e10d6caf', '47');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e4eb203e-03ab-44d0-8caf-f3f768e16bda', '47');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=eae345c3-f66f-44ad-8d1a-c736c0f8a703', '47');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d5eb5e1b-805b-4637-8bc5-d9fec806c7fb', '48');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=043b2985-5a30-4f17-8ad1-8083c0a640b0', '48');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=358d1115-c877-4987-bf82-a9edc22acca9', '48');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=65e488f1-e592-4df1-a4c9-5bf08cde0780', '48');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e2f4694b-52a8-4b3c-9a8c-b5054db2d208', '48');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=a0cfc047-3da4-4cf0-b80e-7917e7b838ee', '49');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3cfe84e2-14ac-4408-a666-656c414d0fb8', '49');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9b8183ad-66fc-4ffd-8001-e9858e9552f2', '49');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=15387ab5-97e6-42a7-9297-3035987accce', '49');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=13d41ed0-f4e3-4f8c-a9fb-ca52aa18e5b0', '49');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=564f7474-df1d-44ad-bfe8-f2627e36a1df', '50');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=a3325364-db20-4fa2-a529-36ec118cccee', '50');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=bc9fcaab-07dc-4f24-b5ef-8fe927001223', '50');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7afa4eb0-70d4-440a-9e74-1bcc61737f48', '50');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3bd2d27b-adb9-4ee1-86e2-8b4f4dc1dc97', '50');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7d52e020-699b-4589-bc14-da54b480fcfd', '51');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d93118f6-5fa5-4614-9fa5-34cce12f1ff0', '51');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=0204cb21-6e02-49f6-a304-914932a25f99', '51');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=480a4f15-03b3-492b-bf0e-c4c9c5132224', '51');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f6057bd5-408f-46fd-a09c-9104e43b064f', '51');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=cb9efb82-cf7e-4b7a-bbdc-71921365cada', '52');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=6396247d-c8be-45f9-b41e-1e293f711fb9', '52');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f259b58a-b752-42fa-bc89-d1d9dc1e90f2', '52');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=15af50e7-5baa-44e6-a7df-fe84fbdddb73', '52');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9b170f4e-e6e4-4c4c-b65b-e793cedae56b', '52');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=da45037a-719b-4ed7-a313-44eb184200b2', '53');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=68fef5f3-cf4e-4d9b-a885-5cbe09caf8cf', '53');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=d2cca2c9-9e9c-4101-92d6-9e1597275266', '53');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=cf6b8893-09d8-4a1a-b2ee-c3e1cb85da3c', '53');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=e411d7cf-a99f-4b03-9a61-33fb86a12b58', '53');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=91b31340-836c-4f7d-84b8-4326e4eb2746', '54');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=9d15afa5-f214-46e4-99a8-578cabc7796c', '54');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f69fe312-5a23-4467-a86d-6e1026a94f04', '54');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=8d18e2b4-058a-43cd-8350-0023a06c9127', '54');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=f1fbe988-de3b-4e35-9238-15ca6d06407f', '54');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7deab30c-97a1-4ffb-9372-6fa8dd886bf0', '55');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=87d7ff19-a4a8-4409-9576-2c7c2ead958e', '55');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=53ed1952-7521-4cbd-81f9-2b1a664211ec', '55');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=427dfc07-c4ea-4e8c-8bfc-3cc6b56713ec', '55');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=482b60df-0de5-4ef8-8ad8-55861e79152a', '55');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=6442153a-e1a7-46c4-822f-105967109b13', '56');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=5a98efb1-32d8-439c-a62b-7a6ea1d0c446', '56');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=604309a9-c083-4abc-8f23-b474d017ad99', '56');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=01dc5deb-be89-40e3-a505-180b7dd4753b', '56');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=7aa980ae-f4c0-48cb-a5ca-6926d5b667a8', '56');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=edffa02d-c230-42c3-bcc1-19cc53a43d6e', '57');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=3731e4a7-f591-48d8-aab0-04d96e71bc56', '57');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=26781b08-ed73-4abf-956f-a3c7c426df7f', '57');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=26f13471-09c9-4cbe-8782-dc2cb569b3a4', '57');
INSERT INTO `case_study_04`.`image` (`URL`, `PRODUCT_ID`) VALUES ('https://storage.vmstyle.vn/api/Image/Get?Id=4b8226ba-395d-47b6-aba7-99b98b511654', '57');
INSERT INTO `case_study_04`.`users` (`NAME`, `PHONE_NUMBER`, `EMAIL`, `PASSWORD`, `ROLE`) VALUES ('PHAM KHANH DUY', '0981039497', 'phamkhanhduy0207@gmail.com', 'Lordloveme.27product', 'ADMIN');
