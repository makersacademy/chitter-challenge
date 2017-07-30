class CHITTER < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    @users = User.all
    erb :'/posts/index'
  end

  post '/posts' do
    time = Time.now
    post = Post.new(text: params[:text],
                    time: time.strftime("Posted on %d/%m/%Y at %I:%M%p"))
    user = User.first(:username => current_user.username)
    post.user << user
    post.save
    # Call 'email' method here
    redirect '/posts'
  end

  get '/posts/new' do
    if current_user
      erb :'/posts/new'
    else
      redirect '/users/new'
    end
  end
end
