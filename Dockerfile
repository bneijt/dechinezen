FROM fpco/stack-build:lts-14.18 as build

#prime layer: build a layer with just the dependencies
COPY prime /opt/prime
RUN stack update
COPY package.yaml Setup.hs stack.yaml /opt/prime/
RUN cd /opt/prime && stack build --system-ghc

RUN mkdir /opt/build
WORKDIR /opt/build

#full build
COPY . /opt/build
RUN stack build --system-ghc

FROM debian:buster-slim
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN apt-get update && apt-get install -y \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*
ENV PORT=8080
USER daemon
COPY --from=build /opt/build/.stack-work/install/x86_64-linux/*/*/bin .
COPY static /opt/app/static
CMD ["/opt/app/dechinezen-exe"]