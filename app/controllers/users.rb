class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :sign_up
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
