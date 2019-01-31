require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

get '/' do
  @peeps = Peep.all
  erb :index
end

post '/add' do
  Peep.add(params[:add_peep])
  redirect '/'
end

end
