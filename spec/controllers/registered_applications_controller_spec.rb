require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:my_registered_application) { RegisteredApplication.create!(name: Faker::Lorem.sentence, url: Faker::Internet.email) }

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

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @registered_application" do
      get :new
      expect(assigns(:registered_application)).not_to be_nil
    end
  end

  describe "RegisteredApplication create" do
      it "increases the number of RegisteredApplication by 1" do
        expect{post :create, params: {registered_application: {name: Faker::Lorem.sentence, url: Faker::Internet.email}}}.to change(RegisteredApplication,:count).by(1)
      end

 # #5
      it "assigns the new registered_application to @registered_application" do
        post :create, params: {registered_application: {name: Faker::Lorem.sentence, url: Faker::Internet.email}}
        expect(assigns(:registered_application)).to eq RegisteredApplication.last
      end

 # #6
      it "redirects to the new registered_application" do
        post :create, params: {registered_application: {name: Faker::Lorem.sentence, url: Faker::Internet.email}}
        expect(response).to redirect_to RegisteredApplication.last
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

      it "assigns my_registered_application to @registered_applications" do
        get :show, params: {id: my_registered_application.id}
        expect(assigns(:registered_application)).to eq(my_registered_application)
      end
    end

    describe "DELETE destroy" do
    it "deletes the registered application" do
      delete :destroy, params: {id: my_registered_application.id}
      count = RegisteredApplication.where({id: my_registered_application.id}).size
      expect(count).to eq 0
    end

    it "redirects to registered application index" do
      delete :destroy, params: {id: my_registered_application.id}
      expect(response).to redirect_to registered_applications_path
    end
  end

end
