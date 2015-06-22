Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_scope :user do
    # get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  resources :pets
  resources :reports
  resources :users

end
