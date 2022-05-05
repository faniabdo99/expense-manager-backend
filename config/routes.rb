Rails.application.routes.draw do
  #Create new user
  get 'api/users', to: 'user#GetAll'
  post 'api/user/create' , to: 'user#PostNewUser'
  #Create contact request
  post 'api/contact', to: 'contact_request#PostNew'
  #Blog (articles) routes
  get 'api/blog', to: 'blog#GetAll'
  get 'api/blog/:slug/:id', to: 'blog#GetSingle'
  post 'api/blog/create', to: 'blog#PostNew'
  post 'api/blog/update', to: 'blog#PostUpdate'
end
