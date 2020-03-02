require 'rails_helper'

RSpec.describe "Unsplash Service" do
  describe "instance methods" do
    describe "#get_photo" do
      it "returns the url of a photo of a given location", :vcr => { :re_record_interval => 7.days } do
        location = "denver"
        service = UnsplashService.new

        url = service.get_photo(location)

        expect(url).to eq("https://images.unsplash.com/photo-1546156929-a4c0ac411f47?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjExODM3N30")
      end
    end
  end
end
