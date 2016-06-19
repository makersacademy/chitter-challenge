ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/peep'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

 get '/' do
   erb :index
 end

 get '/peeps' do
   @peeps = Peep.all
   erb :'peeps/index'
 end

 run! if app_file == $0
end
