require 'sinatra/base'
require 'pg'
require 'Date'
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
    conn = PG.connect(dbname: 'chitter_signup')
    result = conn.exec('SELECT * FROM listofpeeps')
    @peep = result.map { |peep| peep['peepcontent'] }
    erb :homepage

  end

  post '/home' do
    redirect '/sendpeep'
  end

  get '/sendpeep' do
    erb :sendpeep
  end

  post '/sendpeep' do
    datesent = params['datesent']
    peepcontent = params['peepcontent']
    conn = PG.connect(dbname: 'chitter_signup')
    conn.exec("INSERT INTO listofpeeps (datesent , peepcontent) VALUES('#{Date.today}' , '#{peepcontent}')")
    redirect '/home'
  end

  run! if app_file == $0
end
