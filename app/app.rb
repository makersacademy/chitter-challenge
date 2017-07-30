ENV['RACK_ENV'] ||= 'development'

require_relative 'app_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/users' do
    erb(:login)
  end

  get '/users/new' do
    erb(:signup)
  end

  post '/users' do
    #session[:current_user] = User.get(email: params[:email])
    #confirm login
    redirect '/peeps'
  end

  post '/users/new' do
    name = params[:name]
    email = params[:email]
    password = params[:password]
    User.create(name: name, email: email, password: password)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:peeps)
  end

  get '/peeps/new' do
    erb(:peep_new)
  end

  post '/peeps' do
    peepbody = params[:peepbody]
    Peep.create(body: peepbody, user: User.create) #user: session[:current_user])
    redirect '/peeps'
  end

end
