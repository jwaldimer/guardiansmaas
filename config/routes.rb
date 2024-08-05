Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :availabilities, only: %i[index create]
      resources :weeks, only: %i[index]
      resources :services, only: %i[index]
      resources :shifts, only: %i[] do
        get :find, on: :collection
      end
    end
  end
  
  devise_for :users, skip: %i[passwords], path: '', path_names: {
    sign_in: :login,
    sign_out: :logout,
    registration: :signup
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }  
end
