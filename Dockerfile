# ---- Base Image ----
FROM hmcts.azurecr.io/hmcts/base/node/stretch-slim-lts-8 as base
COPY package.json yarn.lock ./
RUN export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH" \
    && yarn install --production \
    && yarn cache clean

# ---- Build Image ----
FROM base as build
COPY . .
RUN yarn install

# ---- Runtime Image ----
FROM hmcts.azurecr.io/hmcts/base/node/stretch-slim-lts-8 as runtime
COPY --from=build $WORKDIR .
EXPOSE 3460
USER hmcts
