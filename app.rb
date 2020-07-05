require 'sinatra/base'
require './lib/chitter'
require './lib/peeps'
class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/send_peeps' do
    Peep.create(username: params[:username], peep: params[:peep], created_at: params[:created_at])
    redirect to('/peeps')
  end

  run! if app_file == $0

end
