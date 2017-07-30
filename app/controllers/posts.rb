class CHITTER < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    erb :'/posts/index'
  end

  post '/posts' do
    time = Time.now
    post = Post.new(text: params[:text],
                    time: time.strftime("Posted on %d/%m/%Y at %I:%M%p"))
    user = User.first(current_user)
    post.user << user
    post.save
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
