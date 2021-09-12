Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :urls, only: [:index, :show, :create, :new]
  #routes.rb
  get "/:shortened_url" => "urls#decode", :constraints => lambda { |request| !request.params[:shortened_url].starts_with?("url")}
  root :to => "urls#new"
end
