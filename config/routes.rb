Rails.application.routes.draw do
  devise_for :users

  get  "/blogs", to: "blogs#index", as: "blogs"

  get  "/blogs/new", to: "blogs#new", as: "new_blog"

  post "/blogs", to: "blogs#create", as: "create_blog"

  get  "/blogs/:id", to: "blogs#show", as: "blog"

  get  "/blogs/:id/edit", to: "blogs#edit", as: "edit_blog"

  patch "/blogs/:id", to: "blogs#update", as: "update_blog"

  delete "/blogs/delete/:id", to: "blogs#destroy", as: "delete_blog"

  root "main#index"

  resource "blog_arquivos", as: "blog_arquivos"
end

# Defines the root path route ("/")
