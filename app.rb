require 'sinatra/base'
require_relative 'lib/peeps.rb'
require_relative 'lib/users.rb'

class Chitter < Sinatra::Base
  enable  :method_override
  use Rack::Session::Cookie, :key => "rack.session",
                            :path => '/',
                            :secret => 'your_secret'

  get '/' do
    @peeps = Peep.all
    erb :'main'
  end

  post '/postPeep' do
    anon_names = ['Mr Mystery Man', 'Anonababe', 'The silent one', "Who Dis?"]
    params['username'] == nil ? user = anon_names.sample : user = params['username']
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
    begin
      User.create(email: params['email'], password: params['password'], username: params['username'], screenname: params['screenname'])
    rescue DetailsAlreadyExist, InvalidEmail => exception
      puts exception
      session["error_message"] = exception.message
      session["error_field"] = exception.field
      
      # params.keys{ |key| params[field] = nil if field != params["error_field"]}
      session[exception.field] = nil
      session['logged_in'] = true
      puts "session : #{session}"
      redirect '/create_account'
    end
    puts "params : #{params}"
    # ['email', 'password'].each { |field| session[field] = nil }
    session['email'] = nil
    params['logged_in'] = true
    redirect '/'
  end

  run! if app_file == $0
end