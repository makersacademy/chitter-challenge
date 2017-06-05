class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :new_user
  end

  post '/users/new' do
    @user = User.create(user_name: params[:user_name],
                        user_email: params[:user_email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation]
                        )

    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:email_notice] = "Please provide a valid email address"
      flash.now[:password_notice] = "Password and confirmation password do not match"
      erb :new_user
    end
  end

end
