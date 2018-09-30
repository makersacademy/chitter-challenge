require "./lib/chitter"
require 'sinatra/base'
require_relative 'database_connection_setup'
require 'sinatra/flash'
require "./lib/users"

class ChitterManager < Sinatra::Base

  enable :method_override
  enable :sessions

  register Sinatra::Flash

  get '/'do
    erb (:sign_in)
  end

  post '/sign_in' do
    #session[:username] = params[:username]
    Users.new(:name => params[:name], :username => params[:username], :email => params[:email], :password => params[:password])
    redirect '/home'
  end

  get '/home' do
    @chitter = Chitter.all(:order => [:id.desc])
    @username = session[:username]
    erb (:index)
  end

  get '/peep/new' do
    erb(:peep_new)
  end

  post '/peep_added' do
    @peep = Chitter.new(:message => params[:peep], :posted_by => session[:username],
    :created_at => Time.now)
    @peep.save
    redirect '/home'
  end

end
