require 'sinatra/base'
require_relative './lib/dummy'
require_relative './lib/authentication'
require_relative './lib/user'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

### LOG IN\OUT HANDLERS ###

  get '/logout' do
    $u = nil
    redirect('/')
  end

### AUTHENTICATION HANDLERS ###

  get '/login_failed' do
    erb :'/login/login_failed'
  end

  get '/sign_up_failed' do
    erb :signup_failed
  end

  post '/sign_up' do
    $d = Dummy.new(params[:user_name], params[:user_pass])
    Authentication.verify ? redirect('/sign_up_failed') : auth_and_sign_up
  end

  get '/attempt_login' do
    $d = Dummy.new(params[:user_name], params[:user_pass])
    Authentication.verify ? redirect('/profile') : redirect('/login_failed')
  end

### SIGN UP HANDLERS ###

  get '/sign_up' do
    erb :'/signup/signup'
  end

### PROFILE ###

  get '/profile' do
    $u = User.new($d.name, $d.pass)
    redirect("/profile/#{$d.name}")
  end

  get '/profile/:name' do
    $all = Peep.all.to_a
    $u = $u
    erb :'/profile/profile'
  end

### PEEPS ###

  post '/post_peep' do
    $u.add_peep(params[:peep_body])
    redirect('/profile')
  end

### METHODS ###

  private

  def auth_and_sign_up
    sql = "INSERT INTO users (username,password) VALUES('#{$d.name}', '#{$d.pass}')"
    result = $connection.exec(sql)
    redirect('/')
  end


  run! if app_file == $0

end
