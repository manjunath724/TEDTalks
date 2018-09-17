Rails.application.routes.draw do
  root "talks#index"

  resources :talks, only: :index do
    get :render_ted, on: :collection
  end
end
