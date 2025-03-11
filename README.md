🏢 1. Tabelas Principais

🔹 Clientes  (clients)
Armazena informações sobre os clientes, como nome, CPF e endereço.

🔹 Pedidos (orders)
Registra as compras feitas pelos clientes, incluindo status, descrição e valor do frete.

🔹 Pagamentos (payment)
Relaciona os pedidos às formas de pagamento, como Pix, crédito e PayPal.

🔹 Entregas (deliver)
Controla as entregas dos pedidos e gera um código de rastreamento.

🔹 Produtos (product)
Guarda os detalhes dos produtos vendidos na plataforma, como nome, categoria, classificação infantil, avaliação e tamanho.

📦 2. Gestão de Estoque e Fornecedores

🔹 Armazém (productStorage)
Registra a quantidade de produtos disponíveis e sua localização.

🔹 Fornecedores (supplier)
Armazena os dados dos fornecedores que abastecem o estoque da loja.

🔹 Relacionamento Fornecedor-Produto (productSupplier)
Indica quais fornecedores fornecem quais produtos e a quantidade fornecida.

🏪 3. Vendedores

🔹 Vendedores (seller)
Registra os vendedores da plataforma, podendo ser empresas ou pessoas físicas.

🔹 Relacionamento Vendedor-Produto (productSeller)
Mostra quais produtos cada vendedor disponibiliza e a quantidade em estoque.

🔗 4. Relacionamentos Importantes

✅ Clientes fazem pedidos
Um cliente pode fazer vários pedidos, mas cada pedido pertence a apenas um cliente.

✅ Pedidos contêm produtos
Cada pedido pode ter vários produtos, e um mesmo produto pode estar em vários pedidos.

✅ Pagamentos estão vinculados aos pedidos
Cada pedido precisa ter um pagamento associado.

✅ Produtos podem estar em estoque
Os produtos precisam estar disponíveis no armazém antes de serem vendidos.

✅ Fornecedores abastecem os produtos
Os produtos vendidos podem ser fornecidos por diferentes empresas.

✅ Vendedores oferecem produtos
Os produtos podem ser vendidos por terceiros dentro da plataforma.
