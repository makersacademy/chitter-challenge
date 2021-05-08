class Chitter < Sinatra::Base
  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/new' do
    redirect '/posts' unless session[:user_id]
    erb :'posts/new'
  end

  post '/posts' do
    Post.create(content: params[:post], user_id: @user.id)
    redirect '/posts'
  end

  get '/posts/:id/edit' do
    @post = Post.find(id: params[:id])
    redirect '/posts' unless @user.id == @post.user_id
    erb :'posts/edit'
  end

  patch '/posts/:id' do
    Post.update(id: params[:id], content: params[:post])
    redirect "/users/:id/posts"
  end

  delete '/posts/:id' do
    Post.delete(id: params[:id])
    redirect '/users/:id/posts'
  end
end
