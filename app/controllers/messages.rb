class Chitter < Sinatra::Base

  get '/messages' do
    @messages = Message.all
    erb :'messages/index'
  end

  get '/messages/new' do
    if session[:user_id] == nil
      flash.keep[:notice] = 'Please sign in!'
      redirect to '/sessions/new'
    else
      erb :'messages/new'
    end
  end

  post '/messages' do
    user_email = current_user.email
    Message.create(message: params[:message], email: user_email)
    redirect '/messages'
  end

end
