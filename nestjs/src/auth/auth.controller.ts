import { Controller, Get, UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from 'src/guards/jwtGuard';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Get('login')
  login() {
    return this.authService.generateToken();
  }

  @UseGuards(JwtAuthGuard)
  @Get('test')
  test() {
    return 'test';
  }
}
