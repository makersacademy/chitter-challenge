ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/peep.rb'
require_relative './models/user.rb'
require_relative './data_mapper_setup.rb'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peep/new'
  end

  get '/peep/new' do
    erb :new_peep
  end

  post '/peeps' do
    message = params[:text]
    peep = Peep.create(
     text: message,
     created_at: DateTime.now
   )
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

end
