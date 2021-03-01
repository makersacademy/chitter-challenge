require 'sinatra/base'
require_relative 'lib/peeps.rb'
require_relative 'lib/users.rb'

class Chitter < Sinatra::Base
  enable  :method_override
  use Rack::Session::Cookie, :key => "rack.session",
                            :path => '/',
                            :secret => 'your_secret'

  get '/' do
    session['logged_in'] = false if session['logged_in'] == nil
    @peeps = Peep.all
    @session = session
    @loginSuccess = params['loginSuccess']
    erb :'main'
  end

  post '/postPeep' do
    anon_names = ['Mr Mystery Man', 'Anonababe', 'The silent one', "Who Dis?"]
    session['username'] == nil ? user = anon_names.sample : user = session['username']
    Peep.create(peep: params['peepMessage'], username: user, timestamp: Time.now.to_i)
    redirect '/'
  end

  get '/create_account' do
    @session = session
    session_list = session.map{ |v| v }
    puts "session : #{session_list}"
    erb :'signup'
  end

  post '/make_new_account' do
    ['email', 'username', 'screenname'].each{ |field| session[field] = params[field] }
    puts "session : #{session}"
    begin
      User.create(email: params['email'], password: params['password'], username: params['username'], screenname: params['screenname'])
    rescue DetailsAlreadyExist, InvalidEmail => exception
      puts exception
      session["error_message"] = exception.message
      session["error_field"] = exception.field
      
      # params.keys{ |key| params[field] = nil if field != params["error_field"]}
      session[exception.field] = nil
      session['logged_in'] = false
      redirect '/create_account'
    end
    puts "params : #{params}"
    # ['email', 'password'].each { |field| session[field] = nil }
    session['email'] = nil
    session['logged_in'] = true
    redirect '/'
  end

  post '/login' do
    check_result = User.check_login(userID: params['loginID'], password: params['password'])[0]
    if check_result != false
      session['logged_in'] = true
      session['username'] = check_result['username']
      session['screenname'] = check_result['screenname']
      redirect '/?loginSuccess=true'
    else
      puts check_result
      redirect '/?loginSuccess=false'
    end
  end

  post '/signout' do
    session.keys.each{ |key| session[key] = nil }
    redirect '/'
  end

  run! if app_file == $0
end