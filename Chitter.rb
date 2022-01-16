require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/peep'

# for accessing test database
# ENV['ENVIRONMENT'] = 'test'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/peep'
  end

  configure :test, :development do
    register Sinatra::Flash
    enable :sessions
  end

  get '/' do
    @peeps = Peep.get_all
    erb :index
  end

  post '/add' do
    flash[:notice] = 'Your post has no content!' unless Peep.add(content: params['content'])
    redirect '/'
  end

  run! if app_file == $0
end
