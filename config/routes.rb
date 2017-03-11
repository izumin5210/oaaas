class AuthenticatedConstraint
  def matches?(request)
    request.session['user_id'].present?
  end
end

Rails.application.routes.draw do
  root to: 'landing#show'

  get '/signin', to: 'sessions#new', as: :signin
  get '/signout', to: 'sessions#destroy', as: :signout
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'

  constraints AuthenticatedConstraint.new do
    scope path: '/@:login_name' do
      root to: 'dashboard#show', as: :user_root
      get '/:app_name', to: 'applications#show'
      resources :applications, as: :apps, only: %(show edit update destroy)
    end

    resources :applications, as: :apps, only: %(new create)
  end
end
