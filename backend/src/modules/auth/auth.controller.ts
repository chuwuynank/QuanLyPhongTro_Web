import { Controller, Post, Body, UsePipes, ValidationPipe } from '@nestjs/common';
import { AuthService } from './auth.service';

class RegisterDto {
  email: string;
  password: string;
  fullName: string;
  phone?: string;
  role?: string;
}

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('register')
  @UsePipes(new ValidationPipe())
  register(@Body() data: RegisterDto) {
    return this.authService.register(data);
  }

  @Post('login')
  login(@Body() body: { email: string; password: string }) {
    return this.authService.login(body.email, body.password);
  }
}
