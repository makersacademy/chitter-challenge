ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :new_peep
  end

  post '/peep_post' do
    peep = Peep.create(subject: params[:Subject], peep: params[:peep_message])
    peep.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :peeps
  end
  run! if app_file == $0
end
