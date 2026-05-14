import {

  async register(dto: any) {
    const existed = await this.prisma.user.findFirst({
      where: {
        OR: [
          { username: dto.username },
          { phone: dto.phone },
        ],
      },
    });

    if (existed) {
      throw new BadRequestException('User already exists');
    }

    const hashedPassword = await bcrypt.hash(dto.password, 10);

    const user = await this.prisma.user.create({
      data: {
        username: dto.username,
        password: hashedPassword,
        fullName: dto.fullName,
        phone: dto.phone,
        role: dto.role,
      },
    });

    return user;
  }

  async login(dto: any) {
    const user = await this.prisma.user.findUnique({
      where: {
        username: dto.username,
      },
    });

    if (!user) {
      throw new UnauthorizedException('Invalid credentials');
    }

    const matched = await bcrypt.compare(
      dto.password,
      user.password,
    );

    if (!matched) {
      throw new UnauthorizedException('Invalid credentials');
    }

    const accessToken = this.jwtService.sign({
      sub: user.id,
      role: user.role,
    });

    return {
      accessToken,
      user,
    };
  }
}