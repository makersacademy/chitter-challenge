ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base
  get '/' do
  redirect '/peep'
  end

  get '/peep' do
  @peeps = Peep.all
   erb :view
  end

  post '/add_peep' do
    Peep.create(message: params[:message])
    redirect '/peep'
  end
end



# run! if app_file == $0
