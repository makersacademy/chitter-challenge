class App < Sinatra::Base

  get '/' do
    redirect to'/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])

    if @user.save
      session[:user_id] = @user.id
      redirect to('/cheeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end

  end

end
