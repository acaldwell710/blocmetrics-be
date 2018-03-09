require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_registered_application] to @registered_applications" do
      get :index
      expect(assigns(:registered_applications)).to eq([my_registered_application])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: my_registered_application.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: {id: my_registered_application.id}
      expect(response).to render_template :show
    end

    it "assigns my_registered_application to @registered_application" do
      get :show, params: {id: my_registered_application.id}
      expect(assigns(:registered_application)).to eq(my_registered_application)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
