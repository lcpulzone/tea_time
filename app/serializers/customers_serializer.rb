class CustomersSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :address
end
