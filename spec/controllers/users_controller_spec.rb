require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
    # creates a new user
    # redirects to homepage
    # signs the user in
    # if it doesn't save, render the new form
    it "adds a new user to the database" do
      count = User.all.count
      post :create, user: {email: "b@example.com"}
      expect(User.all.count).to eq count + 1
    end

    it "redirects to homepage" do
      post :create, user: {email: "b@example.com"}
      expect(response).to redirect_to root_path
    end
  end
end
