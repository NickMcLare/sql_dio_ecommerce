use ecommerce;

select * from clients;
select * from orders;

select * from clients c inner join orders o on c.idClient = o.idOrdersClient
						inner join productOrder p on p.idPOorder = o.idOrders;

select concat(c.Fname, '  ', c.LName) as CompletName, c.CPF, o.ordersStatus, p.typePayment, p.limitAvaible
from clients c inner join orders o on c.idClient = o.idOrdersClient
				inner join payment p on p.idPaymentClient = c.idClient
where p.limitAvaible > 100.00
order by CompletName desc;

select concat(c.Fname, '  ', c.Lname) as NomeClient, c.CPF, p.Pname as Produto, p.category as Categoria, p.avaliação as Avaliação,
		s.socialName as Vendedor, o.idOrders as Pedido, o.ordersStatus as StatusPedido, o.ordersDescription as Descrição, count(po.idPOproduct) as QuantidadeProdutos
from clients c inner join orders o on c.idClient = o.idOrdersClient
				inner join productOrder po on po.idPOorder = o.idOrders
				inner join product p on p.idProduct = po.idPOproduct
                left join productSeller ps on ps.idPproduct = p.idProduct
                left join seller s on s.idSeller = ps.idPSeller
where o.ordersStatus = 'Confirmado'
group by c.idClient, o.idOrders, p.idProduct, s.SocialName
having QuantidadeProdutos > 0
order by NomeClient asc, Avaliação desc;

select concat(Fname, '  ', Lname) CompletName, Address from clients c inner join definiçãoPessoa dp on dp.PF = c.CPF;

desc orders;