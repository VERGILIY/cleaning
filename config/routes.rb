Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'welcome#index'

  resources :call_requests, only: [:new, :create]

  namespace :admin do
    root 'news#index'

    resources :app_settings, only: [:index] do
      collection do
        post :upgrade
      end
    end
  end
end
