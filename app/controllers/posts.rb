class Chitter < Sinatra::Base
  get '/posts/new' do
    erb :'posts/new'
  end

  get '/posts' do

    @posts = Post.all

    erb :'posts/index'
  end

  post '/posts' do

    post = Post.create(post: params[:post], user_id: session[:user_id])

    redirect '/posts'
  end
end
