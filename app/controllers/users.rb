class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:handle],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     email: params[:email])
    if @user.save
      # session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.name}, your account #{@user.handle} has been created"
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

end