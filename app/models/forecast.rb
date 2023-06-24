require 'net/http'
require 'json'

class Forecast
    attr_accessor :data

    def self.find_by_zip zip
        data = get_weather(zip)
        forecast = Forecast.new
        forecast.data = data
        forecast
    end

    def current
        data.current
    end

    def daily
        data.forecast.forecastday
    end

    def details
        daily[0]
    end


    private

    def self.get_weather zip
        Rails.cache.fetch("#{zip}/get_weather", expires: 30.minutes) do
            key = ENV['WEATHER_TOKEN']
            uri = URI("https://api.weatherapi.com/v1/forecast.json?q=#{zip}&aqi=yes&key=#{key}")
            res = Net::HTTP.get(uri)
            JSON.parse(res, object_class: OpenStruct)
        end
    end
end