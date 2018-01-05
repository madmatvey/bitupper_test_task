require 'rails_helper'

RSpec.describe "Txes", type: :request do
  describe "GET /txes" do
    it "works! (now write some real specs)" do
      get txes_path
      expect(response).to have_http_status(200)
    end
  end
end
