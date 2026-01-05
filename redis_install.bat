chcp 65001 >nul
@echo off
title Cai dat Redis DB - Copyright (C) Duong The Vinh. All rights reserved.
:: Kiểm tra xem Redis đã được cài đặt hay chưa bằng cách kiểm tra lệnh redis-server
where redis-server >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    echo Redis is already installed.
    goto END
)
:: Tải Redis từ bản build của Microsoft (chỉ áp dụng cho Windows 10 trở lên)
echo Redis is not installed. Downloading and installing Redis...

wsl --install
 [Net.ServicePointManager]::SecurityProtocol = "Tls12"

:: Tải Redis từ một nguồn tin cậy, ví dụ Microsoft OpenTech Redis
curl -L https://github.com/vinh-dev/Software/releases/download/v1.0/Redis-x64-3.2.100.zip -o redis.zip

:: Giải nén redis.zip vào thư mục hiện tại
powershell -Command "Expand-Archive redis.zip -DestinationPath .\redis"

:: Xóa file zip sau khi giải nén
del redis.zip

:: Di chuyển Redis vào thư mục mong muốn
move redis C:\Redis

:: Thêm Redis vào PATH
setx PATH "%PATH%;C:\Redis"

echo Redis has been installed successfully.

:END
echo Script finished.
pause
:exit
@echo.
@echo ================================================
@echo 			[  Cai dat ket thuc!   ]
@echo ================================================
timeout 3

exit