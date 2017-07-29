require 'sinatra/base'
require_relative 'modles/peep'
require_relative 'datamapper_setup'
require_relative 'lib/time'

class Chitter < Sinatra::Base
enable :sessions

get '/messages' do
  @peeps = Peep.all
  erb :'messages/index'
end

post '/messages' do
Peep.create(peep: params[:peep], time: TodaysDate.new.todays_date_toady)
redirect '/messages'
end

run! if app_file == $0
end
