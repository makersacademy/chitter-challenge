ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require './app/models/peeps'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  post '/peeps' do
    Peep.create(message: params[:message],
                time: "#{(Time.now + 1 * 60 * 60).hour}:#{Time.now.min}")
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    p Peep.all
    erb :'peeps/timeline'
  end

  run! if app_file == $PROGRAM_NAME
end
