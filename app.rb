require 'sinatra/base'
require './lib/peeps'

class Peeps < Sinatra::Base
  enable :sessions
  get '/' do
    erb :'chitter/index'
  end

get'/chitter/peeps' do
  @peeps = Peep.all
    erb :'chitter/peeps'

  # @peeps = session[:peep]
end

# post '/chitter/peeps' do
#   session[:peep] = params[:ChitterMember]
#   redirect '/chitter/peeps'
# end


  run! if app_file == $0
end
