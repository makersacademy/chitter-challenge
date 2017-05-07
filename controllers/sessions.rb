class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email_address: params[:email_address], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/chitter-newsfeed'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:notice] = 'Goodbye until next time'
    redirect to '/chitter-newsfeed'
  end
end
