require 'rails_helper'

RSpec.describe "Archives", type: :request do

   let(:user){
    User.create(
      email: 'danie@example.com',
      password: 'supersecurepassword',
      password_confirmation: 'supersecurepassword',
    )
  }
  
  describe "GET /archives" do
    it "succusfully " do
      get archives_path
      expect(response).to have_http_status(200)
    end

    it "works! (now write some real specs)" do
      get archives_path
      expect(response).to have_http_status(200)
    end

    it "works! (now write some real specs)" do
      get archives_path
      expect(response).to have_http_status(200)
    end

  end
end
