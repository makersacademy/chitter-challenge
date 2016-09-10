class Chitter < Sinatra::Base

  get '/users/sign-up' do
    @current_email = session[:user_email]
    erb :'users/sign_up'
  end

  post '/users/sign-up' do
    @user = User.new(email: params[:email], password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      redirect '/'
    else
      session[:user_id] = @user.id
      session[:user_email] = @user.email
      flash[:notice] = @user.errors.full_messages.join('\n')
      redirect '/users/sign-up'
    end
  end

end
