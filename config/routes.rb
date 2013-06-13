Golden::Menu::Engine.routes.draw do
  resources :hierarchical_menus do
    collection do
      get :list
      post :rebuild
    end
  end
end
