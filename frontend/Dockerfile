FROM ghcr.io/cirruslabs/flutter:3.24.3
WORKDIR /app
COPY . /app
RUN flutter pub get
# RUN flutter build web
CMD ["flutter", "run", "-d", "web-server", "--web-port", "5000", "--web-hostname", "0.0.0.0"]
