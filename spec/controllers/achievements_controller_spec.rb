require 'rails_helper'

describe AchievementsController, type: :controller do
  describe 'GET new' do
    it 'render :new template' do
      get :new
      expect(response).to render_template(:new)
    end

    # assigns contains all instance variables of the action
    it 'assigns new Achievement to @achievement' do
      get :new
      # :achievement is an instance variable inside new method at AchievementsController
      expect(assigns(:achievement)).to be_a_new(Achievement)
    end
  end

  describe 'GET show' do
    let(:achievement) { create(:public_achievement) }

    it 'renders :show template' do
      get :show, params: { id: achievement.id }
      expect(response).to render_template(:show)
    end

    it 'assigns requested achievement to @achievement' do
      get :show, params: { id: achievement.id }
      expect(assigns(:achievement)).to eq achievement
    end
  end

  describe 'POST create' do
    context 'valid data' do
      let(:valid_date) { { achievement: attributes_for(:public_achievement) } }

      it 'redirects to achievements#show' do
        post :create, :params => valid_date
        expect(response).to redirect_to(achievement_path(assigns[:achievement]))
      end

      it 'creates new achievement in database' do
        expect {
          post :create, :params => valid_date
        }.to change(Achievement, :count).by(1)
      end
    end

    context 'invalid data' do
      let(:invalid_data) {
        { achievement: attributes_for(:public_achievement, title: '') }
      }

      it 'renders :new template' do
        post :create, :params => invalid_data

        expect(response).to render_template(:new)
      end

      it "doesn't create new achievement in the database" do
        expect {
          post :create, :params => invalid_data
        }.to_not change(Achievement, :count)
      end
    end
  end
end
