import { IsNotEmpty, IsString, IsNumber, IsArray, IsOptional, ValidateNested } from 'class-validator';
import { Type } from 'class-transformer';

class AddressDto {
  @IsNotEmpty()
  province: string;

  @IsNotEmpty()
  district: string;

  @IsNotEmpty()
  ward: string;

  @IsOptional()
  street?: string;
}

export class CreateRoomDto {
  @IsNotEmpty()
  title: string;

  @IsOptional()
  description?: string;

  @IsNumber()
  price: number;

  @IsNumber()
  area: number;

  @IsNotEmpty()
  roomTypeId: string;

  @ValidateNested()
  @Type(() => AddressDto)
  address: AddressDto;

  @IsArray()
  @IsOptional()
  amenityIds?: string[];

  @IsArray()
  @IsOptional()
  imageUrls?: string[];   
}
