class Chitter

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     user_name: params[:user_name],
                     user_handle: params[:user_handle]
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/list' do
    @users = User.all
    erb :'users/list'
  end

end
