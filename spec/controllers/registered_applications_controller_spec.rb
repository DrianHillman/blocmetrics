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

    describe "GET edit" do
      it "returns http success" do
        get :edit, {id: my_app.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, {id: my_app.id}
        expect(response).to render_template :edit
      end

      it "assigns application to be updated to @application" do
        get :edit, {id: my_app.id}
        app_instance = assigns(:application)

        expect(app_instance.id).to eq my_app.id
        expect(app_instance.name).to eq my_app.name
        expect(app_instance.url).to eq my_app.url
      end
    end

    describe "PUT update" do
      it "updates application with expected attributes" do
        new_name = RandomData.random_name
        new_url = RandomData.random_url

        put :update, id: my_app.id, application: {name: new_name, url: new_url}

        updated_application = assigns(:application)
        expect(updated_application.id).to eq my_app.id
        expect(updated_application.name).to eq new_name
        expect(updated_application.url).to eq new_url
      end

      it "redirects to the updated application" do
        new_name = RandomData.random_name
        new_url = RandomData.random_url

        put :update, id: my_app.id, application: {name: new_name, url: new_url}
        expect(response).to redirect_to registered_application_path(my_app.id)
      end
    end

    describe "DELETE destroy" do
      it "deletes the application" do
        delete :destroy, {id: my_app.id}
        count = Application.where({id: my_app.id}).size
        expect(count).to eq 0
      end

      it "redirects to posts index" do
        delete :destroy, {id: my_app.id}
        expect(response).to redirect_to root_path
      end
    end
  end
end
