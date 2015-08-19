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
      erb :'/users/new'
    end
  end

end
