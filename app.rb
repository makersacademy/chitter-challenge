require 'sinatra/base'
require_relative 'lib/peeps.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @peeps = Peep.all
    erb :'main'
  end

  run! if app_file == $0
end