require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

# for accessing test database
# ENV['ENVIRONMENT'] = 'test'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/peep'
  end

  get '/' do
    @peeps = Peep.get_all
    erb :index
  end

  post '/add' do
    Peep.add(content: params['content'])
    redirect '/'
  end

  run! if app_file == $0
end
