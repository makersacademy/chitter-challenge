class Chitter < Sinatra::Base

  get '/messages' do
    @messages = Message.all
    erb :'messages/index'
  end

  get '/messages/new' do
    unless session[:user_id].nil?
      erb :'messages/new'
    else
      flash.keep[:notice] = 'Must log in'
      redirect '/messages'
    end
  end

  post '/messages' do
    @message = Message.create(message: params[:message],
                              sender_name: current_user.name,
                              sender_username: current_user.username,
                              time_stamp: Time.now.strftime("%H:%M, %d %b '%y"))
    redirect '/messages'
  end

end
