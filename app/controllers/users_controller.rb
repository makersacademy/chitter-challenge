class Chitter

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    new_user = User.new(  email: params[:email],
                          username: params[:username],
                          name: params[:name],
                          password: params[:password],
                          password_confirmation: params[:password_confirmation] )
    if new_user.save
      redirect('/sessions/new')
    else
      flash.now[:errors] = new_user.errors.full_messages
      # flash.now[:errors] = 'An account is already associated with this email address' if User.first(email: params[:email])
      # flash.now[:errors] = 'Sorry, that username is already taken. Please select another' if User.first(username: params[:username])
      # flash.now[:errors] = 'Your passwords did not match' if params[:password] != params[:password_confirmation]
      erb :'/users/new'
    end
  end

end
