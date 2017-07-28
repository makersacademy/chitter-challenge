ENV['RACK_ENV'] ||= 'development'
require_relative 'chitter_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  #  def date_and_time(time)
  #     time.strftime("%c")
  #  end
   def email(email, subject, message)
     Mail.deliver do
       from    'no-reply@chitter.com'
       to      email
       subject subject
       body    message
     end
   end
  end

  get '/' do
    erb :index
  end

  get '/debug' do
    erb :debug
  end

  get '/search' do
    erb :'/peeps'
  end

  run! if $PROGRAM_NAME == "lib/app.rb"
end

require_relative 'controllers/users'
require_relative 'controllers/peeps'
