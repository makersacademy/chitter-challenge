class Chitter < Sinatra::Base

  get '/peeps' do
    @messages = Message.all
    erb :'peeps'
  end

  post '/peeps' do
    message = Message.create(message: params[:message], user_id: current_user.id)
    redirect '/peeps'
  end
end
