FROM rust

RUN apt-get update && apt-get install -y build-essential musl-dev musl-tools \
  && rustup target install x86_64-unknown-linux-musl

WORKDIR /build
ENV RUSTFLAGS="-C target-feature=+crt-static"
RUN git clone https://github.com/dieff/rust-doh.git \
  && cd rust-doh \
  && cargo build --target=x86_64-unknown-linux-musl --release

FROM scratch
COPY --from=0 /build/rust-doh/target/x86_64-unknown-linux-musl/release/doh-proxy .

CMD ["/doh-proxy"]
