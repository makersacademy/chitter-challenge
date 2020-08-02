require 'sinatra'
require 'rack-flash'
require_relative './models/database_start_script'
require_relative './models/peep'

class ChitterApp < Sinatra::Base
  set :static, true
  enable :sessions, :method_override
  use Rack::Flash

  get '/' do
    erb(:index)
  end

  get '/home' do
    erb(:home)
  end

end
