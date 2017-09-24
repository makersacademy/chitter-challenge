require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  get '/' do
    erb :'peeps/new'
  end

post '/users' do
$peep = params[:peep]
redirect '/list'
end

get '/list' do
  @peep = $peep
  erb :'peeps/list'
end

run! if app_file == $0

end
