class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :sign_up
  end

  get '/users/recover_password' do
    erb :password_recovery
  end

  get '/users/enter_token/:password_token' do
    erb :enter_token
  end

  post '/users/token_sent' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
      flash.keep[:notice] = "a token has been emailed to you!"
      redirect("/users/enter_token/#{user.password_token}")
    else
      redirect("/peeps")
    end
  end


  post '/users' do
    @user = User.new(email: params[:email], name: params[:name],
                    username: params[:username], password: params[:password],
                    password_confirmation: params[:confirm_password] )

    if @user.save
      session[:id] = @user.id
      @peeps = Peep.all
      redirect ('/peeps')
    else
      flash.now[:errors]
      erb :sign_up
    end
  end

end
