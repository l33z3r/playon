module WeatherService
  class Api
    def initialize(city_name:)
      @city_name = city_name
    end

    def sixteen_day_forecast
      api_response['list'].map do |day_details|
        extract_daily_details(day_details)
      end
    end

    def specific_day_breakdown(day_number:)
      extract_daily_details(api_response['list'][day_number - 1])
    end

    private

    def extract_daily_details(day_json)
      {
        date: Time.at(day_json['dt']),
        wind_speed: day_json['speed'],
        humidity: day_json['humidity'],
        rain_3h: day_json['rain']
      }
    end

    def api_response
      #TODO: use cache here
      params = {
        q: @city_name,
        appid: api_key,
        cnt: 16,
        units: 'metric'
      }

      JSON.parse(RestClient.get url, { params: params })
    rescue
      #TODO:
    end

    def api_key
      Rails.configuration.x.openweathermap.api_key
    end

    def url
      Rails.configuration.x.openweathermap.url
    end
  end
end