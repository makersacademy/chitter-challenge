class App < Sinatra::Base
  get '/register' do
    erb :'register'
  end

  post '/register' do
    @user = User.new(name: params[:name], username: params[:username],
      email: params[:email], password_confirmation: params[:password_confirmation])
    @user.password = params[:password]
    if @user.save
      session[:user_id] = @user.id
      flash.keep[:message] = :welcome
      redirect '/peeps'
    else
      flash[:name] = params[:name]
      flash[:username] = params[:username]
      flash[:email] = params[:email]
      flash[:errors] = @user.errors.full_messages
      redirect '/register'
    end
  end
end
