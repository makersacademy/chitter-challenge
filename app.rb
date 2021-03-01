require 'sinatra/base'
require './lib/peep'

 class Chitter < Sinatra::Base
   enable :method_override

   get '/' do
     erb :index
   end

   get '/timeline' do
    # @peep = params[:peep]
    @peeps = Peep.all
    erb(:timeline)
  end

   run! if app_file == $0
 end
