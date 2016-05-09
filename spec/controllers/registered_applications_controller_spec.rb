require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  let(:user) { create(:user) }
  let(:my_app) { user.applications.create!(name: RandomData.random_name, url: RandomData.random_url) }

  context "signed in user" do
    before do
      sign_in user
    end

    # describe "GET index" do
    #   it "returns http success" do
    #     get :index
    #     expect(response).to have_http_status(:success)
    #   end
    #
    #   it "assigns [my_app] to @applications" do
    #    get :index
    #    expect(assigns(:applications)).to eq([my_app])
    #  end
    # end

    describe "GET show" do
      it "returns http success" do
        get :show, {id: my_app.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, {id: my_app.id}
        expect(response).to render_template :show
      end

      it "assigns [my_app] to @application" do
        get :show, {id: my_app.id}
        expect(assigns(:application)).to eq(my_app)
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @application" do
        get :new
        expect(assigns(:application)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of Application by 1" do
        expect{post :create, application: {name: RandomData.random_name, url: RandomData.random_url}}.to change(Application,:count).by(1)
      end

      it "assigns the new Application to @application" do
        post :create, application: {name: RandomData.random_name, url: RandomData.random_url}
        expect(assigns(:application)).to eq Application.last
      end

      it "redirects to the new Application" do
        post :create, application: {name: RandomData.random_name, url: RandomData.random_url}
        expect(response).to redirect_to registered_application_path(Application.last.id)
      end
    end

    # describe "GET edit" do
    #   it "returns http success" do
    #     get :edit
    #     expect(response).to have_http_status(:success)
    #   end
    # end
  end
end
