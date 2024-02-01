import { OrderItem } from "src/orders/entities/order-item.entity";
import { Column, CreateDateColumn, Entity, OneToMany, OneToOne, PrimaryGeneratedColumn } from "typeorm";

export enum OrderStatus {
  PENDING = 'PENDING',
  PAID = 'PAID',
  FAILED = 'FAILED'
}

export type CreateOrderCommand = {
  client_id: number;
  items: {
    quantity: number;
    product_id: string;
    price: number;
  }[]
}

@Entity()
export class Order {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ type: 'decimal', precision: 10, scale: 2 })
  total: number;

  @Column()
  client_id: number;

  @OneToMany(() => OrderItem, (item) => item.order)
  items: OrderItem[];

  @Column()
  status: OrderStatus = OrderStatus.PENDING;

  @CreateDateColumn()
  created_at: Date;

  static create(input: CreateOrderCommand) {
    const order = new Order();
    order.client_id = input.client_id;

    order.items = input.items.map(item => {
      const orderItem = new OrderItem();
      orderItem.product_id = item.product_id;
      orderItem.quantity = item.quantity;
      orderItem.price = item.price;

      return orderItem;
    });

    order.total = order.items.reduce((sum, item) => {
      return sum + item.price * item.quantity
    }, 0);

    return order;
  }
}
