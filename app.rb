require 'sinatra/base'
require_relative './lib/peeps'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    'This is a Chitter challenge'
  end

  get '/peeps' do
    @peeps = Peeps.all.sort_by { |a| a.id.to_i }
    erb :'peeps/peeps'
  end

  post '/peeps-add' do
    Peeps.create(message: params[:peep])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'/peeps/new_peep'
  end

  run! if app_file == $0
end
