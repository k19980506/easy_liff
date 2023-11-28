# 使用官方的 Node 映像
FROM node:21

# 設定工作目錄
WORKDIR /app/frontend

# 複製專案檔案到映像中
COPY . .

# 安裝相依套件
RUN npm install

# 啟動應用
CMD ["npm", "start"]
