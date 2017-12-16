require "sinatra/base"

require_relative "./models/peep.rb"
require_relative "data_mapper_setup"


class ChitterApp < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.ordering_reverse_chronological

    erb :'index'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message], created_at: Time.now)
    redirect '/peeps'
  end

  get '/new_message'do
    erb :'new_message'
  end

 run if app_file == $0

end
