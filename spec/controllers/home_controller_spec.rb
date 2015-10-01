require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    subject { get :index }

    it 'get list of messages' do
      expect(subject).to render_template(:index)
    end
  end
end
