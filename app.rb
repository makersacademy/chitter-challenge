require 'sinatra/base'
require_relative 'lib/peeps.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @peeps = Peep.all
    erb :'main'
  end

  post '/postPeep' do
    anon_names = ['Mr Mystery Man', 'Anonababes', 'The silent one', "Who Dis?"]
    params.each { |p| puts p}
    params['username'] == nil ? user = anon_names.sample : user = params['username']
    Peep.create(peep: params['peepMessage'], username: user, timestamp: Time.now.to_i)
    redirect '/'
  end

  run! if app_file == $0
end