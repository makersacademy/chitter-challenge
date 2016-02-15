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
    @users = User.all
    @global_stream = Message.all(:order => [:date.desc])
    erb :stream
  end
end