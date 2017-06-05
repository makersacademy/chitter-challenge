class Chitter < Sinatra::Base

  get '/' do
    redirect '/messages'
  end

  get '/messages' do
    @messages = Message.all(:order => [:created_at.desc])
    erb :messages
  end

  get '/messages/new' do
    erb :new_message
  end

  post '/messages/new' do
    Message.create(user_id: current_user.id, message: params[:message])
    redirect '/messages'
  end

end
