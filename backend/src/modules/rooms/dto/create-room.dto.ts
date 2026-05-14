import {
  IsArray,
  IsNumber,
  IsObject,
  IsString,
  Min,
} from 'class-validator';

export class CreateRoomDto {
  @IsString()
  title: string;

  @IsString()
  description: string;

  @IsNumber()
  @Min(1)
  price: number;

  @IsNumber()
  @Min(1)
  area: number;

  @IsString()
  roomTypeId: string;

  @IsArray()
  amenityIds: string[];

  @IsObject()
  address: {
    province: string;
    district: string;
    ward: string;
    street?: string;
  };
}