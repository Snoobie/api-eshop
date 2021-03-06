Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, :controllers => { sessions: 'v1/users/sessions', registrations: 'v1/users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
