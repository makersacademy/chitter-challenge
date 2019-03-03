require 'sinatra/base'
require_relative './lib/peep'
require 'pg'
require 'data_mapper'
require 'time'

class Chitter < Sinatra::Base

  if ENV['RACK_ENV'] == 'test'
    DataMapper.setup(:default, 'postgres://postgres@127.0.0.1:5432/chitter_test')
  else
    DataMapper.setup(:default, 'postgres://student@127.0.0.1:5432/chitter_prod')
  end

  get '/' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :index
  end

  post '/peep' do
    @time = 
    Peep.create(:name=>params[:user_name],:handle=>params[:handle],:peep_text=>params[:peep_text],:created_at=>Time.now)
    #Peep.create_peep(params[:user_name],params[:handle],params[:peep_text])
    redirect '/'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end