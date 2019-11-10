require 'sinatra/base'
require './lib/peeps.rb'
require 'date'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/peep' do
    Peeps.create(:peep => params['add_peep'], :created_at => Time.now.strftime("%d/%m/%Y %H:%M"))
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all(:order => [ :created_at.desc ])
    erb :peeps
  end

  run! if app_file == $0
end
