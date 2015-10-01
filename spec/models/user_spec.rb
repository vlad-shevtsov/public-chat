require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'authentification with google' do
    let!(:auth) { FactoryGirl.create(:auth) }
    
    it 'from_omniauth method' do
      expect(User.from_omniauth(auth)).to eq User.first
    end
  end

  describe 'get user name' do
    let!(:user) { FactoryGirl.create(:user) }
    
    it 'user_name method' do
      expect(User.user_name(user.id)).to eq User.first.name
    end
  end
end
