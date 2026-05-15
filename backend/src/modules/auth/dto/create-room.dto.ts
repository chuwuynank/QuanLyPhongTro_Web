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
  @IsNotEmpty({ message: 'Tiêu đề không được để trống' })
  title: string;

  @IsOptional()
  description?: string;

  @IsNumber({}, { message: 'Giá phải là số' })
  price: number;

  @IsNumber({}, { message: 'Diện tích phải là số' })
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
