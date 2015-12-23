class Chitter < Sinatra::Base

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/create' do
    @user = User.new(name: params[:name], email: params[:email],
                username: params[:username], password: params[:password],
                password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash[:errors] = @user.errors.full_messages
      redirect '/user/new'
    end
  end

  get '/peeps' do
    erb :'peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      redirect '/peeps'
    else
      flash[:password_error] = 'Incorrect username or password.'
      redirect '/sessions/new'
    end
  end

end
