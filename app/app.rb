require 'data_mapper'
require 'rubygems'
require 'sinatra'

require_relative 'models/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    # "hello"
    @peep = session[:peep]
    @peep_time = session[:time]
    erb(:index)
  end

  post '/post_peep' do
    @peep = Peep.create(text: params[:message], created_at: Time.now)
    session[:peep] = @peep.text
    session[:time] = @peep.created_at
    p "PEEPPP",@peep.created_at
    redirect '/'
  end


  run! if app_file == $0
end
