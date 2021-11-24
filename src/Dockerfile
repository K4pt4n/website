FROM klakegg/hugo:0.83.1-onbuild AS bld
#COPY ./src .

FROM nginx
COPY --from=bld /target /usr/share/nginx/html