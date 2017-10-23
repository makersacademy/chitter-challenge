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
    peep.save
    redirect '/peeps'
  end
end 
