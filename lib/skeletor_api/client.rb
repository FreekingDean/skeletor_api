module SkeletorApi
  class Client
    def initialize(api_key: nil)
      if api_key
        SkeletorApi.config.api_key = api_key
      end
    end

    def get_skeleton(slug)
      self.get "/skeletons/#{slug}"
    end

    protected
    def connection
      @conn ||= Faraday.new(url: BASE_URL) do |conn|
        conn.request :versioned_request, version: SkeletorApi.config.api_version
        conn.request :api_key, key: SkeletorApi.config.api_key

        conn.response :response_wrapper

        conn.adapter Faraday.default_adapter
      end
    end

    def get(url)
      self.connection.get do |request|
        request.url API_URL+url
      end.body
    end
  end
end
