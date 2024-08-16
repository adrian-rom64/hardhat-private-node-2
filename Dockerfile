# This uses standard ganache node.
# It copies blockchain state from template

FROM node:16.15.1-alpine

RUN apk add --update gcc g++ make python3 gcompat

RUN npm install --location global ganache@7.9.2

WORKDIR /node

COPY entrypoint.sh .
COPY template template
COPY template dat

RUN chmod +x entrypoint.sh

EXPOSE 8545

CMD sh entrypoint.sh
