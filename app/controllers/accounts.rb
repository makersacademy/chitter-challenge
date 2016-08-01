class Chitter < Sinatra::Base

  get '/accounts/new' do
    session[:user_id] = nil
    erb :'accounts/new'
  end

  post '/accounts' do
    user = User.create(email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation] )
    if user.save
      session[:user_id] = user.id
      flash.next[:notifications] = ['You have logged in']
      redirect '/peeps'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'accounts/new'
    end
  end


end
