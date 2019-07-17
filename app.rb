require 'sinatra/base'
require_relative './models/peep'
# require_relative './models/chitter'

class ApplicationManager < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/post-peep' do
    Peep.add(params[:peep])
    redirect '/'
  end

  run! if app_file == $0

end