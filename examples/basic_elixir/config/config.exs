import Config

# Configure the OpenTelemetry SDK & Exporter
config :opentelemetry,
  resource: %{service: %{name: "basic_elixir"}},
  span_processor: :batch,
  traces_exporter: :otlp

# Send Debug logs to the console
# config :opentelemetry, traces_exporter: {:otel_exporter_stdout, []}

config :opentelemetry_exporter,
  otlp_protocol: :http_protobuf

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
