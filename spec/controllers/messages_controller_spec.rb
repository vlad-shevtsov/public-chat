require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe '#create' do
    subject { post :create, message: "hi there", type: 'json' }

    context 'current user exists'do
      let!(:user) { FactoryGirl.create(:user) }
      let!(:chat) { FactoryGirl.create(:chat) }

      it 'current user exists, message exists'  do
        session[:user_id] = user.id
        subject
        expect(response.status).to eq 200
      end
    end

    it 'current user doesn`t exists' do
      subject
      expect(response.status).to eq 500
    end
  end
end
