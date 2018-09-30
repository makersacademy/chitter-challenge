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
    session[:username] = params[:username]
    session[:name] = params[:name]
    string = "That username has already been taken, please sign in again"

    @array = Users.all
    @array.each{ |object|
    if object.username == params[:username]
      flash[:error] = string
      redirect "/"
    else
      Users.new(:name => params[:name], :username => params[:username], :email => params[:email], :password => params[:password])
    end
    }
    redirect "/home"
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
    @peep = Chitter.new(:message => params[:peep], :posted_by => session[:name], :username => session[:username],
    :created_at => Time.now)
    @peep.save
    redirect '/home'
  end

end
