require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps/index' do
    @peep = Peep.all
    erb(:'peeps/index')
  end

  post '/peeps/create' do
    Peep.create(message: params[:peep].strip, posted: DateTime.now.strftime('%d/%m/%_Y %_H:%_M'))
    redirect('/peeps/index')
  end

  run! if app_file == $0
end
