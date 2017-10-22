require 'sinatra/base'

class Chitter < Sinatra::Base

get '/' do
  erb :index
end

# post '/peeps' do
#   p params
#   @user = params[:user]
#   @peep = params[:peep]
#   erb :peeps
# end

run! if app_file == $0
end
