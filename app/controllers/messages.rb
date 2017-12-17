
class Chitter < Sinatra::Base

  get '/' do
   redirect '/messages'
  end

  get '/messages' do
    @messages = Message.all(:order => [:created_at.desc])
    erb :'messages/messages'
    end

  get '/messages/new' do
    erb :'messages/new_messages'
  end

  post '/messages/new' do
    Message.create(user_id: current_user.id, message: params[:message])
    redirect '/messages'
  end

end
