# 先下载依赖，然后可以重用镜像，避免每次都重新下载
FROM node:lts-alpine

# 这里安装了 python 来给 node-gyp 提供支持，完成后删除
RUN apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python && \
  npm config set unsafe-perm true && \
  npm install --quiet node-gyp -g && \
  apk --no-cache add git && \
  apk del native-deps
