module PunkApi
  class Client
    def initialize
    end

    def beers(params = {})
      request('beers', params)
    end

    def request(url, params = {})
      url += "/#{params.delete(:id)}" if params[:id]
      response = connection.get url, params
      parse(response)
    end

    def parse(response)
      return [] unless response.success?

      JSON.parse(response.body, object_class: OpenStruct)
    end

    def connection
      @connection ||= Faraday.new('https://api.punkapi.com/v2')
    end
  end
end