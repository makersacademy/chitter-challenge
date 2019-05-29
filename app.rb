require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    erb :chitter
  end

  post '/chitter' do
    session[:name] = params[:name]
    session[:username] = params[:username]
    user = User.new(params[:email], params[:password], params[:name], params[:username])
    user.add
    redirect :signedin
  end

  get '/signedin' do
    @name = session[:name]
    @peeps = Peep.all
    erb :signedin
  end

  post '/signedin' do
    @peep = Peep.new(name: session[:name], username: session[:username], peep: params[:peep], time: Time.now.strftime("%Y-%m-%d %H:%M"))
    @peep.add
    redirect :signedin
  end

  get '/signedin' do
    @peeps = Peep.all
    erb :signedin
  end
end
