class Chitter < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  post '/posts' do
    Post.first_or_create(user: current_user, message: params[:message])
    redirect to '/posts'
  end

  get '/posts/new' do
    erb :'posts/new'
  end
end
