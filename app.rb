require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/partial'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Partial
  end

  enable :sessions

  get '/' do
    @peeps = Peep.all
    @peep_time = session[:time]
    p @peep_time
    erb(:index)
  end
    
  post '/peep' do
    @peep = Peep.add(content: params[:peep])
    session[:time] = @peep.time
    redirect('/')
  end

  run! if app_file == $0
end
