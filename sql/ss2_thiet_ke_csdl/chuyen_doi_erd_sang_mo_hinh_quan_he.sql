create database quan_li_don_hang;
use quan_li_don_hang;
create table phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat date
);
create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(100)
);
create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date
);
create table nha_cung_cap(
ma_nha_cung_cap varchar(100) primary key,
ten_nha_cung_cap varchar(100),
dia_chia varchar(100)
);
create table so_dien_thoai(
ma_nha_cung_cap varchar(100),
so_dien_thoai varchar(100) primary key,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
create table don_dat_hang(
so_don_hang int primary key,
ngay_dat_hang date

);
create table chi_tiet_don_dat_hang(
ma_vat_tu int,
so_don_hang int,
primary key(ma_vat_tu,so_don_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_don_hang) references don_dat_hang(so_don_hang)
);
create table chi_tiet_phieu_xuat(
so_phieu_xuat int,
don_gia double,
so_luong_xuat int,
ma_vat_tu int,
primary key(so_phieu_xuat,ma_vat_tu),
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table chi_tiet_phieu_nhap(
ma_vat_tu int,
don_gia_nhap double,
so_luong_nhap int,
so_phieu_nhap int,
primary key(so_phieu_nhap,ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
-- drop database quan_li_don_hang;