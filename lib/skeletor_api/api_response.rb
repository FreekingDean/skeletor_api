module SkeletorApi
  class ApiResponse
    attr_reader :raw_response

    def initialize(parsed_reponse, raw: '')
      @response = parsed_reponse
      @raw_response = raw
    end

    def [](key)
      @response[key]
    end
  end
end
