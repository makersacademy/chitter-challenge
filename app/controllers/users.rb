class BookmarkManager < Sinatra::Base
  get '/users' do
    # erb :'users/new'
    redirect '/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/messages'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
end
