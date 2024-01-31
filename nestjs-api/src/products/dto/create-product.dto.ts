import { IsNotEmpty, IsPositive, IsString, IsUUID, } from "class-validator";

export class CreateProductDto {
  @IsString()
  @IsNotEmpty()
  description: string;

  id: string;

  @IsString()
  @IsNotEmpty()
  image_url: string;

  @IsString()
  @IsNotEmpty()
  name: string;

  @IsPositive()
  @IsNotEmpty()
  price: number;
}
