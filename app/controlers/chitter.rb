class Chitter < Sinatra::Base

  get '/chitter' do
    @peeps = Peep.all(order: [:id.desc])
    erb :'chitter/index'
  end

  get '/chitter/post' do
    erb :'chitter/peep'
  end

  post '/chitter/post' do
    message = Peep.create(message: params[:message])
    user = current_user
    message.user = user
    message.save
    redirect '/chitter'
  end

end
