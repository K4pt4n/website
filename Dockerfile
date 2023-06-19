FROM archlinux AS bld
RUN pacman -Syu --noconfirm
RUN pacman -Syu --noconfirm hugo git

WORKDIR /src
COPY ./src .

ARG HUGO_BASEURL
ARG HUGO_ENV_ARG
ENV HUGO_BASEURL=${HUGO_BASEURL:-http://localhost/}
ENV HUGO_ENV_ARG=${HUGO_ENV_ARG:-production}
RUN hugo --destination /site

FROM nginx
COPY --from=bld /site /usr/share/nginx/html
