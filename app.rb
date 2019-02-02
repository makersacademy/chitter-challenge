ENV['database_hash'] ||= 'chipchune'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/beep.rb'
require_relative 'lib/user.rb'
require_relative 'lib/passhash_handler.rb'

class ChipChune < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    @user = session['user'] if session['user']
    @beeps = Beep.order(time: :desc)
    @users = User
    erb(:pixelstream)
  end

  post '/' do
    Beep.create(
      body: params['beep'],
      authorid: User.find_by(username: session['user']).id
      ) if session['user']
    redirect '/'
  end

  delete '/session' do
    session['user'] = nil
    redirect('/')
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    @phasher = PassHashHandler.new
    User.create(
      username: params['username'],
      passhash: @phasher.generate_hash('saltysalty' + params['password']),
      email: params['email']
    )
    session['user'] = params['username']
    redirect('/')
  end
end
