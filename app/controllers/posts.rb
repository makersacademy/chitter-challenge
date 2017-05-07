class Chitter < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    post = Post.create(message: params[:message], user: current_user, created_at: Time.now)
    current_user.posts << post
    current_user.save
    redirect to '/posts'
  end

end
