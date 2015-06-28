Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root 'welcome#index'

  resources :call_requests, only: [:new, :create]
  resources :news, only: [:index, :show]
  resources :pages, only: [:show]

  namespace :admin do
    root 'news#index'

    resources :app_settings, only: [:index] do
      collection do
        post :upgrade
      end
    end

    resources :call_requests, except: [:new, :create] do
      member do
        post :mark_as_processed
      end
    end

    resources :pages do
      collection do
        # required for Sortable GUI server side actions
        post :rebuild
      end
    end

    resources :news
  end
end
