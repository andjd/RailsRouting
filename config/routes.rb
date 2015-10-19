Rails.application.routes.draw do
  resources :users, only: [:create, :index, :destroy, :show, :update] do
    resources :contacts, only: :index
    resources :comments, only: :index
  end

  end

  resources :contacts, only: [:create, :destroy, :show, :update] do
    resources :comments, only: :index
  end

  resources :comments, only: [:create, :destroy, :show, :update]

  resources :contact_shares, only: [:create, :destroy]

  # if params[:contact_share_id]
  #   type = "ContactShare"
  #   parent_id = params[:contact_share_id]
  # params[:contact_id]
  #   type = "Contact"
  # params[:comment_id]
  #   type = "Comment"
  #
  # Comment.where(commentable_type: type, commentable_id: id)



  # get '/users' => 'users#index'
  # post '/users' => 'users#create'
  # get '/users/new' => 'users#new', as: 'new_user'
  # get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  # get '/users/:id' => 'users#show', as: 'user'
  # patch '/users/:id' => 'users#update'
  # put '/users/:id' => 'users#update'
  # delete '/users/:id' => 'users#destroy'
end
