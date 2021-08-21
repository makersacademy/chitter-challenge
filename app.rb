require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    @all_peeps = Peep.all_peeps
    erb(:chitter)
  end

  get '/chitter/new' do
    erb(:'chitter/new')
  end

  post '/chitter' do
    peep = Peep.new
    @new_peep = peep.create(params[:peep])
    redirect('/chitter')
  end

  run! if app_file == $0

end
