class Chitter < Sinatra::Base

  post '/stream' do
    @message = Message.create(body: params[:body], date: DateTime.now)
    @user = current_user.messages << @message
    @user.save
    redirect '/stream'
  end
  
  get '/stream/signed' do
    erb :main
  end
  
  get '/stream' do
    @user_mess = current_user.messages if current_user
    @global_stream = User.all.messages(:order => [:date.desc])
    @users = User.all
    erb :stream
  end
end