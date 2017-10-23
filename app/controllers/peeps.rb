require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/peeps' do
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    peep = Peep.create(content: params[:peep_content], created_at: Time.now)
    peep.user = current_user
    if peep.save
      peep.save
      redirect '/peeps'
    else
      if current_user
        flash.keep[:errors] = ["Peep too long!"]
      else
        flash.keep[:errors] = ["You must be signed in to peep!"]
      end
    end
  end
end
