import Config

config :opentelemetry_exporter,
  otlp_endpoint: System.get_env("OTEL_EXPORTER_OTLP_ENDPOINT")
