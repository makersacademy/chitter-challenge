require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

get '/' do
  erb :index
end

get '/peep_page' do
  @peeps = Peep.all
  erb :peep_page
end

post '/peep_page' do
  Peep.create(text: params[:text])
  redirect '/peep_page'
end


  run! if app_file == $0
end 