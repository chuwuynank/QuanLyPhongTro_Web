import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';

import { JwtAuthGuard } from '../../common/guards/jwt-auth.guard';

import { CreateRoomDto } from './dto/create-room.dto';
import { RoomsService } from './rooms.service';

@Controller('rooms')
export class RoomsController {
  constructor(private roomsService: RoomsService) {}

  @Get()
  findAll(@Query() query: any) {
    return this.roomsService.findAll(query);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.roomsService.findOne(id);
  }

  @UseGuards(JwtAuthGuard)
  @Post()
  create(
    @Req() req,
    @Body() dto: CreateRoomDto,
  ) {
    return this.roomsService.create(req.user.sub, dto);
  }

  @UseGuards(JwtAuthGuard)
  @Delete(':id')
  delete(
    @Req() req,
    @Param('id') id: string,
  ) {
    return this.roomsService.delete(id, req.user.sub);
  }
}