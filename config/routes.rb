Rails.application.routes.draw do
  get 'comments/index'
  resources :articles do
    resources :comments
  end

  # resources :articles do
  #   # override method in verbs
  #   member do
  #   end

  #   # if you want multiple data to return
  #   collection do
  #   end
  # end
end
