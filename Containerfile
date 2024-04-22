FROM haxe:4.3.4-alpine3.19 AS build

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install dependencies
COPY *.hxml /usr/src/app/
RUN yes | haxelib install all

# compile the project
COPY . /usr/src/app
RUN haxe build.hxml
RUN pwd


FROM haxe:4.3.4-alpine3.19
WORKDIR /usr/src/app
COPY --from=build /usr/src/app /usr/src/app
RUN apk add --no-cache --update nodejs
CMD ["node", "build.js"]
