require "./lib/chitter"
require 'sinatra/base'
require_relative 'database_connection_setup'
require 'sinatra/flash'


class ChitterManager < Sinatra::Base

  enable :method_override

  register Sinatra::Flash

  get '/'do
    erb (:sign_in)
  end

  post '/sign_in' do
    @username = params[:username]
    redirect '/home'
  end

  get '/home' do
    @chitter = Chitter.all(:order => [:id.desc])
    erb (:index)
  end

  get '/peep/new' do
    erb(:peep_new)
  end

  post '/peep_added' do
    @peep = Chitter.new(:message => params[:peep], :posted_by => "Florence",
    :created_at => Time.now)
    @peep.save
    redirect '/home'
  end

end
