require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

get '/' do
  @peeps = Peep.all
  erb :index
end

post '/add' do
  Peep.add(params[:add_peep])
  redirect '/'
end

get '/add_user' do
  erb :user_form
end

post '/add_user' do
  User.add(params[:email], params[:add_peep])
  redirect '/'
end

end
