require 'rails_helper'

RSpec.describe Api::V1::WeeksController, type: :controller do
  let(:week) { create(:week) }

  describe 'GET #index' do
    it "renders the index template" do
      get :index
      
      expect(response).to have_http_status(:ok)
    end
  end

end
