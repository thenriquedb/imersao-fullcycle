import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { AmqpConnection } from '@golevelup/nestjs-rabbitmq';
import { In, Repository } from 'typeorm';
import { CreateOrderDto } from './dto/create-order.dto';
import { Order } from './entities/order.entity';
import { Product } from '../products/entities/product.entity';

@Injectable()
export class OrdersService {
  constructor(
    @InjectRepository(Order) private orderRepo: Repository<Order>,
    @InjectRepository(Product) private productRepo: Repository<Product>,
    private amqpConnection: AmqpConnection
  ) { }

  async create(createOrderDto: CreateOrderDto) {
    const productIds = createOrderDto.items.map(item => item.product_id);
    const uniqueProductIds = [...new Set(productIds)];
    const products = await this.productRepo.findBy({ id: In(uniqueProductIds) });

    if (products.length !== uniqueProductIds.length) {
      throw new Error(`Algum produto não existe. Produtos passados ${productIds}. Produtos encontrados ${products.map(product => product.id)}.`)
    }

    const order = Order.create({
      client_id: createOrderDto.client_id,
      items: createOrderDto.items.map(item => {
        const product = products.find(product => product.id === item.product_id);

        return {
          price: product.price,
          product_id: item.product_id,
          quantity: item.quantity
        }
      })
    });

    const createdOrder = await this.orderRepo.save(order);
    this.amqpConnection.publish('amq.direct', 'OrderCreated', {
      order_id: createdOrder.id,
      card_hash: createOrderDto.card_hash,
      total: order.total
    })

    return createdOrder;
  }

  findAll(client_id: number) {
    return this.orderRepo.find({
      where: { client_id },
      order: {
        created_at: 'DESC'
      }
    });
  }

  findOne(id: string, client_id: number) {
    return this.orderRepo.findOneOrFail({ where: { id, client_id } });
  }
}
