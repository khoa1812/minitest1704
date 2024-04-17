create database minitest1704;

use minitest1704;

create table PXUAT (
    id int primary key,
    outdate date,
    name varchar(255)
);

create table VATTU (
    id int primary key,
    name varchar(255),
    donvi varchar(255),
    price double
);

create table NHACC (
    id int primary key,
    name varchar(255),
    address varchar(255),
    phone varchar(255)
);

create table DONDH (
    id int primary key,
    orderdate date,
    NHACC_id int, foreign key (NHACC_id) references NHACC (id)
);

create table PNHAP (
    id int primary key,
    indate date,
    DONDH_id int, foreign key (DONDH_id) references DONDH (id)
);

create table TONKHO (
    id int primary key,
    VATTU_id int, foreign key (VATTU_id) references VATTU (id),
    first_quatity int,
    inquatity int,
    outquatity int
);

create table CTDONDH (
    id int primary key,
    DONDH_id int, foreign key (DONDH_id) references DONDH (id),
    VATTU_id int, foreign key (VATTU_id) references VATTU (id),
    quantityDH int
);

create table CTPNHAP (
    id int primary key,
    PNHAP_id int, foreign key (PNHAP_id) references PNHAP (id),
    VATTU_id int, foreign key (VATTU_id) references VATTU (id),
    inquatiry int,
    inprice double,
    description varchar(255)
);

create table CTPXUAT (
    id int primary key,
    PXUAT_id int, foreign key (PXUAT_id) references PXUAT (id),
    VATTU_id int, foreign key (VATTU_id) references VATTU (id),
    outquatity int,
    outprice double,
    description varchar(255)
);



insert into VATTU (id, name, donvi, price) values
                                                 (1, 'Vật tư 1', 'Bộ', 10.5),
                                                 (2, 'Vật tư 2', 'Cái', 20.3),
                                                 (3, 'Vật tư 3', 'Kg', 15.2),
                                                 (4, 'Vật tư 4', 'Bộ', 18.6),
                                                 (5, 'Vật tư 5', 'Bộ', 25.0);


insert into TONKHO (id, VATTU_id, first_quatity, inquatity, outquatity) values
                                                 (1, 1, 100, 50, 20),
                                                 (2, 2, 150, 30, 40),
                                                 (3, 3, 200, 20, 30),
                                                 (4, 4, 120, 40, 10),
                                                 (5, 5, 180, 60, 20),
                                                 (6, 1, 120, 40, 30),
                                                 (7, 2, 170, 20, 40),
                                                 (8, 3, 220, 30, 20),
                                                 (9, 4, 140, 50, 10),
                                                 (10, 5, 200, 70, 30);


insert into NHACC (id, name, address, phone) values
                                                 (1, 'Nhà cung cấp A', 'Địa chỉ A', '0123456789'),
                                                 (2, 'Nhà cung cấp B', 'Địa chỉ B', '0987654321'),
                                                 (3, 'Nhà cung cấp C', 'Địa chỉ C', '0369852147');


insert into DONDH (id, orderdate, NHACC_id) values
                                                 (1, '2024-04-01', 1),
                                                 (2, '2024-04-02', 2),
                                                 (3, '2024-04-03', 3);


insert into PNHAP (id, indate, DONDH_id) values
                                          (1, '2024-04-05', 1),
                                          (2, '2024-04-06', 2),
                                          (3, '2024-04-07', 3);


insert into PXUAT (id, outdate, name) values
                                          (1, '2024-04-10', 'Phiếu xuất 1'),
                                          (2, '2024-04-11', 'Phiếu xuất 2'),
                                          (3, '2024-04-12', 'Phiếu xuất 3');


insert into CTDONDH (id, DONDH_id, VATTU_id, quantityDH) values
                                          (1, 1, 1, 20),
                                          (2, 1, 2, 30),
                                          (3, 2, 3, 25),
                                          (4, 2, 4, 35),
                                          (5, 3, 5, 40),
                                          (6, 3, 1, 50);


insert into CTPNHAP (id, PNHAP_id, VATTU_id, inquatiry, inprice, description) values
                                          (1, 1, 1, 20, 10.5, 'Mô tả 1'),
                                          (2, 1, 2, 30, 20.3, 'Mô tả 2'),
                                          (3, 2, 3, 25, 15.2, 'Mô tả 3'),
                                          (4, 2, 4, 35, 18.6, 'Mô tả 4'),
                                          (5, 3, 5, 40, 25.0, 'Mô tả 5'),
                                          (6, 3, 1, 50, 10.5, 'Mô tả 6');


insert into CTPXUAT (id, PXUAT_id, VATTU_id, outquatity, outprice, description) values
                                          (1, 1, 1, 20, 12.5, 'Mô tả 1'),
                                          (2, 1, 2, 30, 22.3, 'Mô tả 2'),
                                          (3, 2, 3, 25, 17.2, 'Mô tả 3'),
                                          (4, 2, 4, 35, 20.6, 'Mô tả 4'),
                                          (5, 3, 5, 40, 27.0, 'Mô tả 5'),
                                          (6, 3, 1, 50, 12.5, 'Mô tả 6');


-- Câu 1: --
create view vw_CTPNHAP as
select
    PNHAP_id as 'Số phiếu nhập hàng',
    VATTU_id as 'Mã vật tư',
    inquatiry as 'Số lượng nhập',
    inprice as 'Đơn giá nhập',
    (inquatiry * inprice) as 'Thành tiền nhập'
from CTPNHAP;


-- Câu 2 --
create view vw_CTPNHAP_VT as
select
    PNHAP_id as 'Số phiếu nhập hàng',
    VATTU_id as 'Mã vật tư',
    name as 'Tên vật tư',
    inquatiry as 'Số lượng nhập',
    inprice as 'Đơn giá nhập',
    (inquatiry * inprice) as 'Thành tiền nhập'
from CTPNHAP
         join VATTU on VATTU.id = CTPNHAP.VATTU_id;


-- Câu 3 --
create view vw_CTPNHAP_VT_PN as
select
    PNHAP.id as 'Số phiếu nhập hàng',
    PNHAP.indate as 'Ngày nhập hàng',
    PNHAP.DONDH_id as 'Số đơn đặt hàng',
    VATTU.id as 'Mã vật tư',
    VATTU.name as 'Tên vật tư',
    CTPNHAP.inquatiry as 'Số lượng nhập',
    CTPNHAP.inprice as 'Đơn giá nhập',
    (CTPNHAP.inquatiry * CTPNHAP.inprice) as 'Thành tiền nhập'
from CTPNHAP
         join PNHAP on PNHAP.id = CTPNHAP.PNHAP_id
         join VATTU on VATTU.id = CTPNHAP.VATTU_id;


-- Câu 4 --
create view vw_CTPNHAP_VT_PN_DH as
select
    PNHAP.id as 'Số phiếu nhập hàng',
    PNHAP.indate as 'Ngày nhập hàng',
    DONDH.id as 'Số đơn đặt hàng',
    NHACC.id as 'Mã nhà cung cấp',
    VATTU.id as 'Mã vật tư',
    VATTU.name as 'Tên vật tư',
    CTPNHAP.inquatiry as 'Số lượng nhập',
    CTPNHAP.inprice as 'Đơn giá nhập',
    (CTPNHAP.inquatiry * CTPNHAP.inprice) as 'Thành tiền nhập'
from CTPNHAP
         join PNHAP on PNHAP.id = CTPNHAP.PNHAP_id
         join DONDH on PNHAP.DONDH_id = DONDH.id
         join NHACC on DONDH.NHACC_id = NHACC.id
         join VATTU on VATTU.id = CTPNHAP.VATTU_id;


-- Câu 5 --
create view vw_CTPNHAP_loc as
select
    PNHAP_id as 'Số phiếu nhập hàng',
    VATTU_id as 'Mã vật tư',
    inquatiry as 'Số lượng nhập',
    inprice as 'Đơn giá nhập',
    (inquatiry * inprice) as 'Thành tiền nhập'
from CTPNHAP
where inquatiry > 5;


-- Câu 6 --
CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT
    pnh.id AS so_phieu_nhap,
    vt.id AS ma_vat_tu,
    vt.name AS ten_vat_tu,
    ctp.inquatiry AS so_luong_nhap,
    ctp.inprice AS don_gia_nhap,
    (ctp.inquatiry * ctp.inprice) AS thanh_tien_nhap
FROM
    CTPNHAP ctp
        JOIN
    PNHAP pnh ON ctp.PNHAP_id = pnh.id
        JOIN
    VATTU vt ON ctp.VATTU_id = vt.id
WHERE
        vt.donvi = 'Bộ';


-- Câu 7 --
create view vw_CTPXUAT as
select
    PXUAT_id as 'Số phiếu xuất hàng',
    VATTU_id as 'Mã vật tư',
    outquatity as 'Số lượng xuất',
    outprice as 'Đơn giá xuất',
    (outquatity * outprice) as 'Thành tiền xuất'
from CTPXUAT;


-- Câu 8 --
create view vw_CTPXUAT_VT as
select
    PXUAT_id as 'Số phiếu xuất hàng',
    VATTU_id as 'Mã vật tư',
    name as 'Tên vật tư',
    outquatity as 'Số lượng xuất',
    outprice as 'Đơn giá xuất'
from CTPXUAT
         join VATTU on VATTU.id = CTPXUAT.VATTU_id;


-- Câu 1 --
delimiter //

create procedure GetFinalQuantity(in vattu_id int)
begin
    select
        VATTU_id,
        (first_quatity + sum(inquatity) - sum(outquatity)) as final_quantity
    from
        TONKHO
    where
            VATTU_id = vattu_id
    group by
        VATTU_id;
end //

delimiter ;


-- Câu 2 --
delimiter //

create procedure GetTotalSales(in vattu_id int)
begin
    select
        VATTU_id,
        SUM(outquatity * outprice) as total_sales
    from
        CTPXUAT
    where
            VATTU_id = vattu_id
    group by
        VATTU_id;
end //

delimiter ;


-- Câu 3 --
delimiter //

create procedure GetTotalOrderQuantity(in dondh_id int)
begin
    select
        DONDH_id,
        SUM(quantityDH) AS total_quantity
    from
        CTDONDH
    where
            DONDH_id = dondh_id
    group by
        DONDH_id;
end //

delimiter ;


-- Câu 4 --
delimiter //

create procedure AddOrder(in order_date date, in nhacc_id int)
begin
    insert into DONDH (orderdate, NHACC_id)
    values (order_date, nhacc_id);
end //

delimiter ;


-- Câu 5 --
delimiter //

create procedure DeleteSupplier(IN nhacc_id INT)
begin
    update DONDH
    set NHACC_id = null
    where NHACC_id = nhacc_id;

    delete from NHACC
    where id = nhacc_id;
end //

delimiter ;


-- Câu 6 --
delimiter //

create procedure DeleteSupplier(in nhacc_id int)
begin
    update DONDH
    set NHACC_id = NULL
    where NHACC_id = nhacc_id;

    delete from NHACC
    where id = nhacc_id;
end //

delimiter ;




















