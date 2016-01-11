class App < Sinatra::Base
  get '/register' do
    erb :register
  end

  post '/register' do
    @user = User.new(name: params[:name], username: params[:username],
      email: params[:email], password_confirmation: params[:password_confirmation])
    @user.password = params[:password]
    if @user.save
      session[:user_id] = @user.id
      flash.next[:message] = :welcome
      redirect '/peeps'
    else
      flash.next[:name] = params[:name]
      flash.next[:username] = params[:username]
      flash.next[:email] = params[:email]
      flash.next[:errors] = @user.errors.full_messages
      redirect '/register'
    end
  end
end
