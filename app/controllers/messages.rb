class Chitter < Sinatra::Base

  get '/messages' do
    @messages = Message.all
    erb(:'messages/index')
  end

  get '/messages/new' do
    erb(:'messages/new')
  end

  post '/messages' do
    Message.create(message: params[:message])
    redirect '/messages'
  end

end
