require 'sinatra/base'
require_relative 'lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb(:'welcome')
  end

  post '/add' do
    erb(:'chitters/add')
  end

  get '/chitters' do
    @peeps = Peep.all
    erb(:'chitters/index')
  end

  post '/chitters' do
    Peep.add_peep(params[:user_id], params[:message])
    redirect to '/chitters'
  end

  run! if app_file == $0
end
