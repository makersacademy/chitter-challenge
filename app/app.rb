ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'dm_setup'


class Chitter < Sinatra::Base

  get '/' do
    redirect 'peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peep/new' do
    erb :new_peep
  end

  post '/peep/new' do
    Peep.create(message: params[:message], created_at: DateTime.now)
    redirect '/peeps'
  end
end
