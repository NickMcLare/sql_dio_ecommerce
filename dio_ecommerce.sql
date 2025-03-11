-- criação do banco de dados de e-commerce --
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

create table clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null,
        Address varchar(233),
        constraint unique_cpf_client unique (CPF)
);

create table definiçãoPessoa(
	PF char(11),
    PJ bool default false,
    primary key (PF, PJ),
    constraint fk_pessoa_fisica foreign key(PF) references clients (CPF)
);
drop table definiçãoPessoa;

alter table clients auto_increment=1;

create table product(
	idProduct int auto_increment primary key,
    idPClient int primary key,
    Pname varchar(10),
	Classification_kids bool default false,
	category enum ('Eletrônicos','Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliação float default 0,
    size varchar(10),
    constraint fk_product_client foreign key (idPClient) references clients(idClient)
);

drop table product;

alter table product modify column Pname varchar(233);

create table payment(
	idPaymentClient int,
    idPayment int,
    typePayment enum('Credito', 'Pix', 'PayPal'),
    limitAvaible float,
    primary key(idPaymentClient, idPayment),
    constraint unique_payment unique(idPayment),
    constraint fk_payment_client foreign key(idPaymentClient) references clients(idClient)
);
-- drop table payment;
-- show create table payment;

create table orders(
	idOrders int auto_increment primary key,
	idOrdersClient int,
    ordersStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    ordersDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    idPayment_orders int,
    constraint fk_orders_client foreign key (idOrdersClient) references clients(idClient),
    constraint fk_idPayment_cash foreign key (idPayment_orders) references payment(idPayment)
);

alter table orders auto_increment=1;

create table deliver(
	idDeliver int auto_increment,
    idDeliver_Orders int,
    statusDeliver enum('Em trânsito', 'Entregue') default 'Em trânsito',
    codRastreio varchar(10) unique,
    primary key (idDeliver, idDeliver_Orders),
    constraint fk_deliver_orders foreign key (idDeliver_Orders) references Orders(idOrders)
);
drop table deliver;

alter table deliver auto_increment=1;
DELIMITER $$

create trigger after_insert_orders
before insert on deliver
for each row 
begin
	repeat
		set new.codRastreio = substring(md5(rand()), 1,10);
	until ( (select count(*) from deliver where codRastreio = new.codRastreio) = 0)
	end repeat;
end$$

DELIMITER ;

desc orders;
create table productStorage(
	idProductStorage int auto_increment primary key,
    storageLocation varchar(100),
    quantity int default 0
);

create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(100) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(100) not null,
    location varchar(100),
    CNPJ char(15),
    CPF char(11),
    contact char(11) not null,
    constraint unique_seller_CNPJ unique (CNPJ),
    constraint unique_seller_CPF unique (CPF)
);

create table productSeller(
	idPSeller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPSeller, idPproduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_product_order foreign key (idPOproduct) references product (idProduct),
    constraint fk_order_order foreign key (idPOorder) references orders (idOrders)
);


create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_seller foreign key (idLproduct) references product (idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage (idProductStorage)
);

show tables;
