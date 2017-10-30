require 'rails_helper'

RSpec.describe SettingsController, type: :controller do

  describe "GET #product_management" do
    it "returns http success" do
      get :product_management
      expect(response).to have_http_status(:success)
    end
  end

end
