module SkeletorApi
  class Config
    attr_accessor :api_key, :api_version

    def initialize(api_key: '', api_version: LATEST_API_VERSION)
      @api_key = api_key
      @api_version = api_version
    end
  end
end
