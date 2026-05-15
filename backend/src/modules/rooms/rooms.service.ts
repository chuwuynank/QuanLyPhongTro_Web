import { Injectable, NotFoundException, ForbiddenException } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';

@Injectable()
export class RoomsService {
  constructor(private prisma: PrismaService) {}

  async findAll(query: any = {}) {
    const { district, minPrice, maxPrice, roomTypeId, search, status = 'AVAILABLE' } = query;

    return this.prisma.room.findMany({
      where: {
        status,
        ...(district && { 
          address: { district: { contains: district, mode: 'insensitive' } } 
        }),
        ...(minPrice && { price: { gte: Number(minPrice) } }),
        ...(maxPrice && { price: { lte: Number(maxPrice) } }),
        ...(roomTypeId && { roomTypeId }),
        ...(search && {
          OR: [
            { title: { contains: search, mode: 'insensitive' } },
            { description: { contains: search, mode: 'insensitive' } },
          ],
        }),
      },
      include: {
        address: true,
        roomType: true,
        images: true,
        amenities: {
          include: { amenity: true },
        },
      },
      orderBy: { createdAt: 'desc' },
    });
  }

  async findOne(id: string) {
    const room = await this.prisma.room.findUnique({
      where: { id },
      include: {
        address: true,
        roomType: true,
        images: true,
        amenities: { include: { amenity: true } },
        owner: {
          select: { id: true, fullName: true, phone: true, avatar: true },
        },
      },
    });

    if (!room) throw new NotFoundException('Không tìm thấy phòng trọ');
    return room;
  }

  async create(userId: string, dto: any) {
    return this.prisma.$transaction(async (tx) => {
      // Tạo Address
      const address = await tx.address.create({
        data: dto.address,
      });

      // Tạo Room
      const room = await tx.room.create({
        data: {
          ownerId: userId,
          addressId: address.id,
          roomTypeId: dto.roomTypeId,
          title: dto.title,
          description: dto.description,
          price: Number(dto.price),
          area: Number(dto.area),
          status: 'AVAILABLE',
        },
      });

      // Thêm Amenities
      if (dto.amenityIds?.length) {
        await tx.roomAmenity.createMany({
          data: dto.amenityIds.map((amenityId: string) => ({
            roomId: room.id,
            amenityId,
          })),
        });
      }

      // Thêm Images (nếu có)
      if (dto.imageUrls?.length) {
        await tx.roomImage.createMany({
          data: dto.imageUrls.map((url: string, index: number) => ({
            roomId: room.id,
            imageUrl: url,
            isMain: index === 0,
          })),
        });
      }

      return this.findOne(room.id); // Trả về đầy đủ thông tin
    });
  }

  async delete(id: string, userId: string) {
    const room = await this.prisma.room.findUnique({ where: { id } });

    if (!room) throw new NotFoundException('Không tìm thấy phòng');
    if (room.ownerId !== userId) {
      throw new ForbiddenException('Bạn không có quyền xóa phòng này');
    }

    return this.prisma.room.update({
      where: { id },
      data: { status: 'HIDDEN' },   
    });
  }
}
