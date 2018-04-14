require 'sinatra/base'
require './lib/peep'
require 'pry'
require 'sinatra/flash'
require 'uri'

class Chitter < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, 'key'
    register Sinatra::Flash
  end

  run! if app_file == $0

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :index
  end

  post '/peeps/new' do

    if params[:peep_text] == ""
      flash[:error] = "No peep text given"
    else
      Peep.create(Peep.new(params[:peep_text], params[:name], params[:handle]))
    end

    redirect '/peeps'
  end

end
