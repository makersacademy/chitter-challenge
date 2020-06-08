require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb(:view_peeps)
  end

  get '/new' do
    erb(:add_peep)
  end

  post '/' do
    Peep.add(peep: params[:peep], title: params[:title])
    redirect '/'
  end

  run! if app_file == $0
end
