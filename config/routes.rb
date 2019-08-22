Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  get "/images", to: "images#index"

  get "home/csv", to: "home#csv"
  get "users/search", to: "users#search"

  get "home/pdf", to: "home#pdf"
  get "employees/search", to: "employees#search"

  get "home/mail", to: "home#mail"
  get "students/search", to: "students#search"

  resources :home , only: [:index]

  resources :users, :images
  
  resources :employees, :students
 
end