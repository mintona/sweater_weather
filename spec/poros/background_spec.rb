require 'rails_helper'

RSpec.describe Background do
  it 'exists with attributes' do
    url = "https://images.unsplash.com/photo-1534430480872-3498386e7856?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjExODM3N30"
    background = Background.new(url)

    expect(background).to be_a Background
    expect(background.id).to eq(nil)
    expect(background.url).to eq(url)
  end
end
