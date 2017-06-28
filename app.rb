require 'sinatra'
require 'json'

get '/cars' do
  content_type :json

  cars = [
    {
      name:"Tesla Model S",
      price:90000
    },
    {
      name:"Toyota Prius",
      price:23000
    },
    {
      name:"Subaru Outback",
      price:20000
    }
  ]

  if request.query_string == 'tax=true'
    add_tax(cars).to_json
  else
    cars.to_json
  end
end

def add_tax(cars)
  cars.each do |car|
    car.merge!(price: car[:price] * 1.18)
  end
end
