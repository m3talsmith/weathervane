class ForecastController < ApplicationController
    def index
    end

    def for_zip
        puts params[:zip]
        @forecast = Forecast.find_by_zip(params[:zip])
    end
end
