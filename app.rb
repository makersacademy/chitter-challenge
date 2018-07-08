require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/peep'


class Chitter < Sinatra::Base
    enable :sessions
    use Rack::MethodOverride
    register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/post' do
    Peep.create(posts_a_peep: params['posts_a_peep'])
    redirect('/')
  end


  run! if app_file == $0

end
