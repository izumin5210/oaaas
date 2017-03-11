class AuthenticatedConstraint
  def matches?(request)
    request.session['user_id'].present?
  end
end

Rails.application.routes.draw do
  root to: 'landing#show'

  get '/signin',                  to: 'sessions#new', as: :signin
  get '/signout',                 to: 'sessions#destroy', as: :signout
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure',            to: 'sessions#failure'

  constraints AuthenticatedConstraint.new do
    root                                   to: 'dashboard#show', as: :user_root
    post   '/apps',                        to: 'applications#create', as: :create_app
    get    '/apps/new',                    to: 'applications#new', as: :new_app
    get    '/@:login_name',                to: 'applications#index', as: :apps
    delete '/@:login_name/:app_name',      to: 'applications#destroy'
    patch  '/@:login_name/:app_name',      to: 'applications#update'
    get    '/@:login_name/:app_name',      to: 'applications#show', as: :app
    get    '/@:login_name/:app_name/edit', to: 'applications#edit', as: :edit_app
  end
end
