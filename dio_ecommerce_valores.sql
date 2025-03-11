use ecommerce;

insert into clients (Fname, Minit, Lname, CPF, Address)
		values ('Maria', 'M', 'Silva', 123456789, 'rua irineu 234, Pintada - Cidade das rosas'),
			   ('Matheus', 'O', 'Pimentei', 987654321, 'rua alameda 239, Centro - Cidade das rosas'),
               ('Ricardo', 'F', 'Silva', 456789123, 'avenida alameda alves 789, Banca - Cidade das rosas'),
               ('Julia', 'S', 'Franca', 789456123, 'rua mintaga 345, Vituas - Cidade das flores'),
               ('Roberta', 'G', 'Assis', 321654987, 'rua Pata 623, Cassu - Cidade das rosas'),
               ('Isabela', 'M', 'Cruz', 456123789, 'rua Mindua 987, Centro - Cidade das rosas');
               
insert into product (Pname, classification_kids, category, avaliação, size) values
									('Fone de ouvido', false, 'Eletrônicos', '4', null),
                                    ('Barbie Elsa', True, 'Brinquedos', '3', null),
                                    ('Body Carters', true, 'Vestimenta', '5', null),
                                    ('Microfone Vedo - Youtube', false, 'Eletrônicos', '4', null),
                                    ('Sofá retrátil', false, 'Móveis', '3', '3x57x80'),
                                    ('Farinha de arroz', false, 'Alimentos', '2', null),
                                    ('Fire Stick Amazon', false, 'Eletrônicos', '3', null);

insert into orders (idOrdersClient, ordersStatus, ordersDescription, sendValue, paymentCash) values
							(1, default, 'compra via aplicativo', null, 1),
                            (2, default, 'compra via aplicativo', 50, 0),
                            (3, 'Confirmado', null, null, 1),
                            (4, default, 'compra via web site', 150, 0);
                            
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values 
							(1,1,2, null),
                            (2,2,1, null),
                            (3,3,1, null);
                            
select * from orders;
select * from product;

insert into productStorage (storageLocation, quantity) values 
							('Rio de Janeiro', 1000),
                            ('Rio de Janeiro', 500),
                            ('São Paulo', 10),
                            ('São Paulo', 100),
                            ('São Paulo', 10),
                            ('Brasília', 60);
                            
insert into storageLocation (idLproduct, idLstorage, location) values 
								(1,2, 'RJ'),
                                (2,6, 'GO');
                                
insert into supplier (SocialName, CNPJ, contact) values
							('Almeida e filhos', 123456789123456, '21985474'),
                            ('Eletrônicos Silva', 987654321321654, '21985484'),
                            ('Eletrônicos Valma', 123987654789456, '21975474');
                            
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
							(1,1,500),
                            (1,2,400),
                            (2,4,633),
                            (3,3,5),
                            (2,5,10);
                            
insert into seller (SocialName, CNPJ, CPF, location, contact) values
					('Tech eletronics', 123456789456321, null, 'Rio de Janeiro', 219946287),
                    ('Botique Durgas', null, 123456783, 'Rio de Janeiro', 219956285),
                    ('Kids World', 456789123654485, null, 'São Paulo', 119946483);
                    
                    
insert into productSeller (idPseller, idPproduct, prodQuantity) values
							(1,6,80),
                            (2,7,10);

insert into definiçãoPessoa (PF, PJ) VALUES (123456789, true),
											(456789123, false),
                                            (321654987, false),
                                            (456123789, true);
select * from clients;

insert into payment (idPaymentClient, idPayment, typePayment, limitAvaible) values
					(1, 1, 'Pix', 89.59),
                    (2, 2, 'Crédito', 5000.00),
                    (3, 3, 'Crédito', 800.00),
                    (4, 4, 'PayPal', 10000.00),
                    (5, 5, 'Pix', 50.99);
                    
select * from payment;

SELECT * FROM clients;
SELECT * FROM product;
SELECT * FROM orders;
SELECT * FROM productOrder;
SELECT * FROM seller;
SELECT * FROM productSeller;
select * from payment;
select * from definiçãoPessoa;
