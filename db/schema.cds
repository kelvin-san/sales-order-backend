using { managed } from '@sap/cds/common';

namespace sales;

entity SalesOrderHeaders: managed {
  key id: UUID;
      custumer: Association to Custumers;
      totalAmount: Decimal(15, 2);
      itens: Composition of many SalesOrderItens on itens.header = $self;
}

entity SalesOrderItens {
  key id: UUID;
      header: Association to SalesOrderHeaders;
      product: Association to Products;
      quantity: Integer;
      price: Decimal(15, 2);
}

entity Custumers {
  key id: UUID;
      firstName: String(20);
      lastName: String(20);
      email: String(255);
}

entity Products {
  key id: UUID;
      name: String(255);
      price: Decimal(15, 2);
}