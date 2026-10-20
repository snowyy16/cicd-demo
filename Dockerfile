FROM node:20-alpine

WORKDIR /app
# 3. Khai báo môi trường Production
ENV NODE_ENV=production
# 4. Copy package files trước để tận dụng Docker Cache
COPY package*.json ./
# 5. Cài đặt các thư viện phục vụ chạy ứng dụng (loại bỏ các thư viện test như jest)
RUN npm ci --only=production
# 6. Copy mã nguồn ứng dụng
COPY app.js server.js ./
# 7. TIÊU CHUẨN BẢO MẬT: Chạy container dưới quyền user thường (node), không dùng root
USER node
# 8. Mở cổng 3000 cho ứng dụng
EXPOSE 3000
# 9. Lệnh khởi chạy server
CMD ["node", "server.js"]