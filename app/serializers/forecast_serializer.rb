class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :location,
              :country,
              :current_conditions,
              :forecast_today,
              :eight_hour_forecast,
              :five_day_forecast

  attribute :location do |object|
    object.location.city_state
  end

  attribute :country do |object|
    object.location.country
  end
end
