class HomeController < ApplicationController
  def index
    @forecast = WeatherService::Api.new(city_name: 'dublin').sixteen_day_forecast
  end
end
