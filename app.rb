require 'sinatra/base'
require 'pg'
class Chitter < Sinatra::Base

  get '/' do
    erb :signupform
  end

  post '/' do
    username = params['username']
    password = params['password']
    conn = PG.connect(dbname: 'chitter_signup')
    conn.exec("INSERT INTO details (username , password) VALUES('#{username}' , '#{password}')")
    redirect '/home'
  end
  get '/home' do
    erb :homepage

  end

  post '/home' do
    redirect '/sendpeep'
  end
  
  get '/sendpeep' do
    erb :sendpeep
  end
  run! if app_file == $0


end
