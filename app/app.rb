ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'database_setup'
# require 'sinatra/flash'

class ChitterClone < Sinatra::Base
  # enable :sessions
  # set :session_secret, 'super secret'
  # register Sinatra::Flash

  get '/peeps' do
    @peeps ||= Peep.all.reverse
    erb :'peeps/index'
  end

  post '/peep/new' do
    peep = Peep.create(body: params[:peep_body])
    peep.save
    redirect to('/peeps')
  end

  get '/signup_to_peep' do
    erb :'sign_up/signup_to_peep'
  end

  post '/signup_new' do
    user = User.create(real_name: params[:real_name],
                username: params[:username],
                email_address: params[:email_address],
                password: params[:password])

    user.save
    redirect to('/peeps')
  end

  run! if app_file == $PROGRAM_NAME
end
