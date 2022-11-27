FROM alpine AS download

WORKDIR /Simpleweb-main

RUN apk add --no-cache openssh-client git

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh,id=key,required git clone git@github.com:tibby57/Simpleweb-main.git lab2.v1

FROM node:alpine

COPY --from=download /Simpleweb-main/Simpleweb /Simpleweb-main

WORKDIR /Simpleweb-main/Simpleweb

RUN npm install

EXPOSE 8080

CMD ["npm", "start"]