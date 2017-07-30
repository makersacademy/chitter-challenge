class CHITTER < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    erb :'/posts/index'
  end

  post '/posts' do
    time = Time.now
    post = Post.new(text: params[:text],
                    time: time.strftime("Posted on %d/%m/%Y at %I:%M%p"))
    post.save
    redirect '/posts'
  end

  get '/posts/new' do
    erb :'/posts/new'
  end
end
