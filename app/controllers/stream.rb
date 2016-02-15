class Chitter < Sinatra::Base

  post '/stream' do
    @message = Message.create(body: params[:body], date: DateTime.now)
    user = current_user.messages << @message
    user.save
    redirect '/stream'
  end
  
  get '/stream/signed' do
    erb :main
  end
  
  get '/stream' do
    @global_stream = User.all.messages(:order => [:date.desc])
    @users = User.all
    erb :stream
  end
end