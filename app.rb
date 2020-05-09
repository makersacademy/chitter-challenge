require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/peeps' do
    @result = Peep.all
    @name = session[:name]
    @username = session[:username]
    erb(:index)
  end

  get '/peeps/new' do
    erb(:new)
  end

  post '/peeps' do
    p "Form data submitted to the /peeps route!"
    Peep.add(peep: params[:peep])
    redirect('/peeps')
  end

  get '/peeps/signup' do
    erb(:signup)
  end

  post '/peeps/signup' do
    p "Form data submitted to the /signup route!"
    User.add(name: params[:name], username: params[:username], password: params[:password])
    session[:name] = params[:name]
    session[:username] = params[:username]
    redirect('/peeps')
  end

  get '/peeps/login' do
    erb(:login)
  end

  post '/peeps/login' do
    session[:username] = params[:username]
    redirect('/peeps')
  end

end
