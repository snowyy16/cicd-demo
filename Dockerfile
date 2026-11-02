# dùng alpine linux siêu nhẹ để giảm thiểu lỗ hổng bảo mật
FROM node:20-alpine

# thư mục làm việc trong container
WORKDIR /app

# thiết lập môi trường chạy production
ENV NODE_ENV=production

# sao chép file khai báo thư viện trước để tận dụng bộ nhớ đệm
COPY package*.json ./

# chỉ cài đặt thư viện cần thiết, loại bỏ công cụ dev và test
RUN npm ci --only=production

# sao chép mã nguồn ứng dụng
COPY app.js server.js ./

# chạy bằng tài khoản thường thay vì root để tăng cường bảo mật
USER node

# mở cổng ứng dụng
EXPOSE 3000

# lệnh khởi chạy máy chủ
CMD ["node", "server.js"]
