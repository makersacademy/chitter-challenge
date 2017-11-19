ENV['RACK_ENV'] = 'development'

require 'data_mapper'
require 'rubygems'
require 'sinatra'

require_relative 'models/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    # "hello"
    @peeps = Peep.all
    erb(:index)
  end

  post '/post_peep' do
    Peep.create(text: params[:message], created_at: Time.now)
    # session[:peep] = Peep.all
    # session[:time] = @peep.created_at
    # p "PEEPPP", Peep.all
    redirect '/'
  end


  run! if app_file == $0
end
