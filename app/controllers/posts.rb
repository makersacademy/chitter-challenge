class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    @post = Post.new(name: current_user.name,
                username: current_user.username,
                peep: params[:peep])
    if @post.save
      @posts = Post.all
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = @post.errors.full_messages
      erb :'peeps/new'
    end
  end

end