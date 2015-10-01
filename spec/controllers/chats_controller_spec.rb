require 'rails_helper'

RSpec.describe ChatsController, type: :controller do
  describe '#create' do
    it 'create' do
      expect {
        post :create
      }.to change(Chat, :count).by(1)
    end
  end
end
