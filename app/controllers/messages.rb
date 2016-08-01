class Chitter < Sinatra::Base
  get '/messages' do
    @messages = Message.all
    erb :'messages/index'
  end

  post '/messages/add' do
    time = Time.new.strftime("%d/%m/%Y %R")
    message = Message.create(message: params[:message],
                             created_on: time)
    current_user.messages << message
    current_user.save
    # message.save
    redirect '/messages'
  end

  get '/messages/new' do
    erb :'messages/new'
  end
end
