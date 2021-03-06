Rails.application.routes.draw do

  # ## #### ## ## ## ## ## ## ## ## ## ## ##
  # Devise
  #
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations'
    #omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    match '/users/sign_out' => 'devise/sessions#destroy', as: :destroy_user_session_path, via: [:get, :delete]
  end

  get 'sign_in', to: redirect('/users/sign_in')
  get 'sign_out', to: redirect('/users/sign_out')
  get 'sign_up', to: redirect('/users/sign_up')
  get 'edit_registration', to: redirect('/users/edit')

  get 'users', to: redirect("sign_up")

  # ## #### ## ## ## ## ## ## ## ## ## ## ##
  # Generic Routes
  #
  get '/', to: redirect('sign_up')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: "home#index"

  resources :billboards, only: [:index] do
    member do
      post 'vote'
    end
  end

  get 'get_current_user_id' => 'users#get_current_user_id'

end
