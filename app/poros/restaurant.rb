class Restaurant
  attr_reader :name
  def initialize(restaurant_info)
    @name = restaurant_info[:name]
    @address = restaurant_info[:location][:display_address]
  end

  def address
    @address.join(', ')
  end

  def info
    { name: @name, address: address}
  end
end
