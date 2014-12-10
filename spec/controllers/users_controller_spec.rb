require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
    let(:request) { post :create, user: {email: "b@example.com"} }
    # creates a new user
    # redirects to homepage
    # signs the user in
    # if it doesn't save, render the new form
    it "adds a new user to the database" do
      count = User.all.count
      request
      expect(User.all.count).to eq count + 1
    end

    it "redirects to homepage" do
      request
      expect(response).to redirect_to root_path
    end

    it "assign the user id to session" do
      request
    end
  end
end
