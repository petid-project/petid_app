Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get "sign_out", :to => "devise/sessions#destroy"
  end
  # devise_scope :user do get "/some/route" => "some_devise_controller" end

  get "/pets/:id/report_lost", to: "reports#new", as: "new_report"

  resources :pets
  resources :reports, except: [:update]
  resources :users
<<<<<<< HEAD
  get "/reports/:id/contact_user", to: "reports#contact_user", as: "contact_user"
=======

  patch "/reports/:id", to: 'reports#update', as: "update_report"

>>>>>>> c8e999d28bc21afbc3d97bfca11df1e3147aac7d
  root 'welcome#index'

end
