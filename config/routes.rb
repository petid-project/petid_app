Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get "sign_out", :to => "devise/sessions#destroy"
  end
  # devise_scope :user do get "/some/route" => "some_devise_controller" end

  get "/pets/:id/report_lost", to: "reports#new", as: "new_report"

  resources :pets, except: [:index]
  resources :reports, except: [:update]
  resources :users, except: [:index]

  patch "/reports/:id", to: 'reports#update', as: "update_report"

  root 'welcome#index'

end
