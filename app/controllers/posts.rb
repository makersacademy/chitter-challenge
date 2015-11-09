class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  get '/peeps' do
    @posts = Post.all
    erb :'/peeps/index'
  end

  post '/peeps' do
    time = Time.new
    post = Post.new(peep: params[:peep],
                    creation_time: time)
    post.user = current_user
    if post.save
      redirect to '/peeps'
    else
      flash.now[:errors] = @post.errors.full_messages
      erb :'peeps/new'
    end
  end

end