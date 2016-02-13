ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @new_peep = false
    @posts = Peep.all 
    erb :index
  end

  get '/compose_peep' do
    @new_peep = true
    erb :index
  end

  post '/update_peeps' do
    Peep.new(message: params[:message], time: "#{Time.now.strftime('%H:%M')}").save
    redirect '/'
  end

  run! if app_file == $0
end
