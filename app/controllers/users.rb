class Chitter < Sinatra::Base

  post '/users/new' do
    @user =  User.new(name: params[:name], username: params[:username], email_address: params[:email_address],password_confirmation: params[:password_confirmation], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      ChitterMailer.call(current_user)
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      # clarify in naming
      erb :'users/user_signup'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/user_signup'
  end

end
