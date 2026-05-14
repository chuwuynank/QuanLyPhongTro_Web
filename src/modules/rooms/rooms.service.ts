import {
  ForbiddenException,
  Injectable,
} from '@nestjs/common';

import { PrismaService } from '../../prisma/prisma.service';

@Injectable()
export class RoomsService {
  constructor(private prisma: PrismaService) {}

  async findAll(query?: any) {
    return this.prisma.room.findMany({
      where: query || {},

      include: {
        address: true,
        roomType: true,
        images: true,
      },
    });
  }

  async findOne(id: string) {
    return this.prisma.room.findUnique({
      where: { id },

      include: {
        address: true,
        roomType: true,
        images: true,
        amenities: {
          include: {
            amenity: true,
          },
        },
      },
    });
  }

  async create(userId: string, dto: any) {
    return this.prisma.$transaction(async (tx) => {
      const address = await tx.address.create({
        data: dto.address,
      });

      const room = await tx.room.create({
        data: {
          ownerId: userId,
          addressId: address.id,
          roomTypeId: dto.roomTypeId,
          title: dto.title,
          description: dto.description,
          price: dto.price,
          area: dto.area,
        },
      });

      if (dto.amenityIds?.length) {
        await tx.roomAmenity.createMany({
          data: dto.amenityIds.map((id: string) => ({
            roomId: room.id,
            amenityId: id,
          })),
        });
      }

      return room;
    });
  }

  async delete(id: string, userId: string) {
    const room = await this.prisma.room.findUnique({
      where: { id },
    });

    if (!room || room.ownerId !== userId) {
      throw new ForbiddenException(
        'Bạn không có quyền xóa phòng này',
      );
    }

    return this.prisma.room.update({
      where: { id },

      data: {
        status: 'DELETED',
      },
    });
  }
}