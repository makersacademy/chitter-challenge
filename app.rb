require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    @all_peeps = Peep.all_peeps
    erb(:'chitter/index')
  end

  get '/chitter/newest_first' do
    @all_peeps = Peep.newest_peeps
    erb(:'chitter/index')
  end

  get '/chitter/oldest_first' do
    redirect('/chitter')
  end

  get '/chitter/new' do
    erb(:'chitter/new')
  end

  post '/chitter' do
    @new_peep = Peep.create(params[:New_Peep])
    redirect('/chitter')
  end

  run! if app_file == $0

end
