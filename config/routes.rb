class AuthenticatedConstraint
  def matches?(request)
    request.session['user_id'].present?
  end
end

Rails.application.routes.draw do
  constraints AuthenticatedConstraint.new do
    root to: 'dashboard#show', as: :user_root
  end

  root to: 'landing#show'

  get '/signin', to: 'sessions#new', as: :signin
  get '/signout', to: 'sessions#destroy', as: :signout
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
end
