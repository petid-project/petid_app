Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get "sign_out", :to => "devise/sessions#destroy"
  end
  # devise_scope :user do get "/some/route" => "some_devise_controller" end
  root 'welcome#index'
  get "/pets/:id/report_lost", to: "reports#new", as: "new_report"

  resources :pets, except: [:index]
  resources :reports, except: [:update]
  resources :users, except: [:index]

  get "/reports/:id/contact_user", to: "reports#contact_user", as: "contact_user"
  patch "/reports/:id", to: 'reports#update', as: "update_report"
end


  # Ensure you have overridden routes for generated controllers in your route.rb.
  # For example:

  #   Rails.application.routes.draw do
  #     devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }
  #   end
