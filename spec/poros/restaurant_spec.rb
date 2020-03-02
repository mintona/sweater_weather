require 'rails_helper'

RSpec.describe Restaurant do
  it "exists with attributes" do
    restaurant_data = {
                        :id=>"M4MwxQAA58B7ENV8ootI-w",
                        :name=>"Kan's Kitchen",
                        :is_closed=>false,
                        :location=>
                                  {
                                    :address1=>"1620 S Prairie Ave",
                                    :address2=>nil,
                                    :address3=>nil,
                                    :city=>"Pueblo",
                                    :zip_code=>"81005",
                                    :country=>"US",
                                    :state=>"CO",
                                    :display_address=>["1620 S Prairie Ave", "Pueblo, CO 81005"]},
                                  }
    restaurant = Restaurant.new(restaurant_data)

    expect(restaurant).to be_a Restaurant

    expect(restaurant.name).to eq("Kan's Kitchen")
    expect(restaurant.address).to eq("1620 S Prairie Ave, Pueblo, CO 81005")

    restaurnt_info = {
                        name: "Kan's Kitchen",
                        address: "1620 S Prairie Ave, Pueblo, CO 81005"
                      }

    expect(restaurant.info).to eq(restaurnt_info)
  end
end
