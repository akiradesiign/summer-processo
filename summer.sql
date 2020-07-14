create database db_summer;
use db_summer;

create table tb_cor (
	cd_cor int not null,
    nm_cor varchar(80),
    constraint pk_cor
		primary key(cd_cor)
);

create table tb_data (
	cd_data int not null,
    dt_data timestamp,
    constraint pk_data
		primary key(cd_data)
);

create table tb_status (
	cd_status int not null,
    nm_status varchar(45),
    constraint pk_status 
		primary key(cd_status)
);

create table tb_preco (
	cd_preco int not null,
    vl_preco decimal(12,2),
    vl_taxas decimal(12,2),
    vl_envio decimal(12,2),
    constraint pk_preco
		primary key(cd_preco)
);

create table tb_tamanho (
	cd_tamanho int not null,
    ds_tamanho varchar(100),
    qt_altura float,
    qt_largura float,
    qt_comprimento float,
    qt_peso float,
    constraint pk_tamanho
		primary key(cd_tamanho)
);

create table tb_estoque (
	cd_estoque int not null,
    qt_quantidade int,
    constraint pk_estoque
		primary key(cd_estoque)
);

create table tb_modelo (
	cd_modelo int not null,
    nm_modelo varchar(100),
    ds_modelo varchar(1000),
    cd_status int,
    cd_data int,
    cd_cor int,
    constraint pk_modelo
		primary key(cd_modelo),
	constraint fk_modelo_status
		foreign key(cd_status)
			references tb_status(cd_status),
	constraint fk_modelo_data
		foreign key(cd_data)
			references tb_data(cd_data),
	constraint fk_modelo_cor
		foreign key(cd_cor)
			references tb_cor(cd_cor)
);

create table tb_imagem (
	cd_imagem int not null,
    im_imagem varchar(255),
    ds_principal varchar(20),
    cd_status int,
    cd_data int,
    constraint pk_imagem
		primary key(cd_imagem),
	constraint fk_imagem_status
		foreign key(cd_status)
			references tb_status(cd_status),
	constraint fk_imagem_data
		foreign key(cd_data)
			references tb_data(cd_data)
);

create table tb_categoria (
	cd_categoria int not null,
    nm_categoria varchar(64),
    cd_categoriaPai int,
    cd_status int,
    constraint pk_categoria
		primary key(cd_categoria),
	constraint fk_categoria_categoriaPai
		foreign key(cd_categoriaPai)
			references tb_categoria(cd_categoria),
	constraint fk_categoria_status
		foreign key(cd_status)
			references tb_status(cd_status)
);

create table tb_produto (
	cd_produto varchar(32) not null,
    nm_produto varchar(100),
    ds_produto TEXT,
    ds_curto VARCHAR(150),
    ds_amigavel VARCHAR(128),
    ds_extra VARCHAR(100),
    cd_categoria int,
    cd_status int,
    cd_data int,
    cd_tamanho int,
    cd_estoque int,
    constraint pk_produto
		primary key(cd_produto),
	constraint fk_produto_categoria
		foreign key(cd_categoria)
			references tb_categoria(cd_categoria),
	constraint fk_produto_status
		foreign key(cd_status)
			references tb_status(cd_status),
	constraint fk_produto_data
		foreign key(cd_data)
			references tb_data(cd_data),
	constraint fk_produto_tamanho
		foreign key(cd_tamanho)
			references tb_tamanho(cd_tamanho),
	constraint fk_produto_estoque
		foreign key(cd_estoque)
			references tb_estoque(cd_estoque)
);

create table item_modelo (
	cd_modelo int,
    cd_produto varchar(32),
    constraint c_modelo_produto
		primary key(cd_modelo, cd_produto),
	constraint fk_modelo_produto
		foreign key(cd_modelo)
			references tb_modelo(cd_modelo),
	constraint fk_produto_modelo
		foreign key(cd_produto)
			references tb_produto(cd_produto)
);

create table item_imagem (
	cd_produto varchar(32),
    cd_imagem int,
    constraint c_produto_imagem
		primary key(cd_produto, cd_imagem),
	constraint fk_produto_imagem
		foreign key(cd_produto)
			references tb_produto(cd_produto),
	constraint fk_imagem_produto
		foreign key(cd_imagem)
			references tb_imagem(cd_imagem)
);

create table item_preco (
	cd_produto varchar(32),
    cd_preco int,
    constraint c_produto_preco
		primary key(cd_produto, cd_preco),
	constraint fk_produto_preco
		foreign key(cd_produto)
			references tb_produto(cd_produto),
	constraint fk_preco_produto
		foreign key(cd_preco)
			references tb_preco(cd_preco)
);
