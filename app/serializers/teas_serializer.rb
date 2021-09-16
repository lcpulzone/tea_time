class TeasSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :temperature_in_fahrenheit, :brew_time_in_minutes
end
