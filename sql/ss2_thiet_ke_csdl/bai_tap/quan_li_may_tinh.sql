create database quan_li_ban_hang;
use quan_li_ban_hang;
create table khach_hang(
ma_khach_hang varchar(100) primary key,
name varchar(100),
so_dien_thoai varchar(100),
email varchar(100),
ma_loai_khach_hang varchar(100),
foreign key(ma_loai_khach_hang) references loai_khach_hang(ma_loai_khach_hang)
);
create table loai_khach_hang(
ma_loai_khach_hang varchar(100),
loai_khach_hang varchar(100)
);
create table may_tinh(
ma_may_tinh varchar(100)primary key,
hang_san_xuat varchar(100),
vi_tri_dat_may varchar(100)
);
create table dich_vu_di_kem(
ten_dich_vu varchar(100) primary key,
gia double
);
create table hoa_don(
ma_hoa_don varchar(100) primary key,
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime,
ten_dich_vu varchar(100),
ma_khach_hang varchar(100),
ma_may_tinh varchar(100),
foreign key(ten_dich_vu) references dich_vu_di_kem(ten_dich_vu),
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key(ma_may_tinh) references may_tinh(ma_may_tinh)
);
create table su_dung(
ma_may_tinh varchar(100),
ma_khach_hang varchar(100),
primary key (ma_may_tinh,ma_khach_hang),
foreign key(ma_may_tinh) references may_tinh(ma_may_tinh)
);
create table hoa_don_dich_vu_di_kem(
ma_hoa_don varchar(100),
ten_dich_vu varchar(100),
primary key(ma_hoa_don,ten_dich_vu),
foreign key(ten_dich_vu) references dich_vu_di_kem(ten_dich_vu),
foreign key(ma_hoa_don) references hoa_don(ma_hoa_don)
);
