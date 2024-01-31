import { Type } from "class-transformer";
import { ArrayNotEmpty, IsInt, IsNotEmpty, IsPositive, IsString, IsUUID, MaxLength, ValidateNested } from "class-validator";

export class CreateOrderDto {
  @IsString()
  @MaxLength(255)
  @IsNotEmpty()
  card_hash: string;

  @ArrayNotEmpty()
  @ValidateNested({ each: true })
  @Type(() => OrderItemDto)
  items: OrderItemDto[];
}

export class OrderItemDto {
  @IsInt()
  @IsPositive()
  @IsNotEmpty()
  quantity: number;

  @IsString()
  @IsNotEmpty()
  @IsUUID()
  product_id: string;
}