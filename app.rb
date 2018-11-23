require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/new' do
    erb(:new)
  end

  post '/' do
    Peep.create(user_id: '1', content: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
