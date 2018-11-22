require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/new' do
    erb(:new)
  end

  post '/new' do
    Peep.create(text: params[:text], time: Time.now)
    redirect '/'
  end

  run! if app_file == $0
end
