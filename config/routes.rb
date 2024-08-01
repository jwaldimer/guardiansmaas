Rails.application.routes.draw do
  devise_for :users, skip: %i[passwords], controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
