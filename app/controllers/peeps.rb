# require './app/models/user.rb'

class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    peep = Peep.create(message: params[:message], user: current_user)
    current_user.peeps << peep
    current_user.save
    redirect '/'
  end
end
