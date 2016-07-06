require 'json'

module SkeletorApi
  module FaradayMiddleware
    class ApiKey < Faraday::Middleware
      def initialize(app,options)
        @key = options.fetch(:key)
        super(app)
      end

      def call(env)
        env[:request_headers]["Authorization"] = "SkeletorSecret key=#{@key}"
        @app.call(env)
      end

      Faraday::Request.register_middleware api_key: -> { ApiKey }
    end

    class VersionedRequest < Faraday::Middleware
      def initialize(app,options)
        @version = options.fetch(:version)
        super(app)
      end

      def call(env)
        env[:request_headers]["Accept"]       = "application/json; version=#{@version}"
        env[:request_headers]["Content-Type"] = "application/json; version=#{@version}"
        @app.call(env)
      end

      Faraday::Request.register_middleware versioned_request: -> { VersionedRequest }
    end

    class ResponseWrapper < Faraday::Middleware
      def call(env)
        response = @app.call(env)
        response.on_complete do |response_env|
          raw_body = response_env[:body]
          parsed_response = JSON.parse(raw_body, symbolize_names: true) rescue {}

          response_env[:body] = SkeletorApi::ApiResponse.new(parsed_response, raw: raw_body)
        end
      end

      Faraday::Response.register_middleware response_wrapper: -> { ResponseWrapper }
    end
  end
end
