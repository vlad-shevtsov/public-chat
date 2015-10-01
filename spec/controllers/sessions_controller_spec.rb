require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#create' do
    let!(:auth) { FactoryGirl.create(:auth) }
    subject { post :create }
    before(:each) do
      request.env['omniauth.auth'] = auth
    end

    it 'create user' do
      expect {
        subject
      }.to change(User, :count).by(1)
    end

    it 'create session' do
      subject
      expect(session[:user_id]).to eq User.first.id
    end

    it 'redirect ro root' do
      expect(subject).to redirect_to root_path
    end
  end

  describe '#destroy' do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do |test|
      session[:user_id] = user.id
    end
    subject { delete :destroy, id: "sing_out" }

    it 'update exists attribute' do
      subject
      expect(User.first.exists).to eq false
    end

    it 'destroy session' do
      subject
      expect(session[:user_id]).to eq nil
    end

    it 'redirect to root' do
      expect(subject).to redirect_to root_path
    end
  end
end
