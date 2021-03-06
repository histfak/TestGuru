Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}, controllers: {sessions: 'sessions'}
  root 'tests#index'

  get '/feedbacks', to: 'feedbacks#new', format: false
  post '/feedbacks', to: 'feedbacks#create'

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :badges, only: :index

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges
  end
end
