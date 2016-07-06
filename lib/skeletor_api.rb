require 'faraday'

require 'skeletor_api/version'
require 'skeletor_api/config'
require 'skeletor_api/client'
require 'skeletor_api/api_response'

require 'skeletor_api/faraday_middleware/middleware'

module SkeletorApi
  #BASE_URL = 'https://www.skeletor-app.com'.freeze
  BASE_URL = 'http://localhost:3000'.freeze
  API_URL = '/api'.freeze

  class << self
    attr_writer :config

    def config
      @config ||= Config.new
    end

    def configure
      yield(self.config)
    end
  end
end
