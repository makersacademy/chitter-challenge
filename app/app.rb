ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base
  get '/' do
  erb :sign_up
  end

  get '/main' do
  @peeps = Peep.all
   erb :main
  end

  post '/add_peep' do
    Peep.create(message: params[:message],time: Time.now.strftime('%H:%M'))
    redirect '/main'
  end

  post '/sign_up' do
    User.create(name: params[:name], email: params[:email])
    redirect '/main'
  end
end



# run! if app_file == $0
