require 'sinatra/base'

require_relative './database_setup.rb'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class ChitterApp < Sinatra::Base

    get '/' do
      @peeps = Peep.get_peeps
        erb(:index)
    end

    post '/new' do
       Peep.add_peeps(params['message'], Time.now)
       redirect '/signed_in'
    end

    post '/sign_up' do
       User.create(username: params['username'], name: params['name'], password: params['password'], email: params['email'])
       redirect '/signed_in'
    end

    get '/signed_in' do
        @peeps = Peep.get_peeps
        @user = User.current_user
        erb(:signed_in)
    end

end
