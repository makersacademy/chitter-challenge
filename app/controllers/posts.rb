class Fitter < Sinatra::Base
  get '/' do
    redirect '/posts'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    post = Post.create(tip: params[:tip])
    post.user = current_user
    post.save
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index', :layout => :layout
  end
end
