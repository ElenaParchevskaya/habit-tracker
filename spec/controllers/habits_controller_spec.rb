require 'rails_helper'

RSpec.describe HabitsController, type: :controller do
  let(:habit) { create(:habit) }

  describe 'GET #new' do
    before { get :new }

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      subject(:request) { post :create, params: { habit: attributes_for(:habit) } }

      it 'saves a new habit in the database' do
        expect { request }.to change(Habit, :count).by(1)
      end

      it 'redirects to show view' do
        request
        expect(response).to render_template :show
      end
    end

    context 'with invalid attributes' do
      subject(:request) { post :create, params: { habit: attributes_for(:habit, :invalid) } }

      it 'does not save the habit' do
        expect { request }.to_not change(Habit, :count)
      end

      it 'renders new view' do
        request
        expect(response).to render_template :new
      end
    end
  end
end
