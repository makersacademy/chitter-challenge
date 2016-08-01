class Chitter < Sinatra::Base
  get '/posts/new' do
    if current_user
      erb :'posts/new'
    else
      flash.keep[:notice] = 'You need to sign in to post.'
      redirect to '/posts'
    end
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  post '/posts' do
    postedTime = (Time.now).strftime("%H:%M (%d-%b-%Y)")
    Post.create(post: params[:post], postedTime: postedTime, user_id: session[:user_id])
    redirect '/posts'
  end
end
