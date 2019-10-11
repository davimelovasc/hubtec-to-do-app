require 'rails_helper'
require 'devise'

describe TasksController, :type => :controller  do
    describe 'GET #index' do
      context 'when user is logged in' do
        before do
          sign_in FactoryBot.build(:user)
          get :index
        end
        it { is_expected.to respond_with :ok }
        it { is_expected.to respond_with_content_type :html }
        it { is_expected.to render_with_layout :application }
        it { is_expected.to render_template :index }
      end
      context 'when user is logged out' do
        before do
          get :index
        end
        it { is_expected.to redirect_to new_session_path }
#        it { is_expected.to set_the_flash(:warning).to('Please log in.') }
#        it { is_expected.to set_session(:return_to).to(posts_path) }
      end
    end
  end