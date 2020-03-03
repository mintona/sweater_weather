require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :api_key }
  end

  describe 'model methods' do
    describe 'set_api_key' do
      it 'sets the api_key' do
        user = User.new(email: "email@email.com", password: "password", password_confirmation: "password")

        expect(user.api_key).to be_nil
        user.set_api_key

        expect(user.api_key).to_not be_nil
        expect(user.api_key).to be_a String
        expect(user.api_key.length).to eq(27)
      end
    end
  end
end
