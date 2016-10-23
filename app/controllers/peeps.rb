require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :'/peeps/index'
  end

  post '/peeps' do
    if current_user && !params[:peep_text].empty?
      peep = Peep.create(peep_text: params[:peep_text], user_id: current_user.id)
      redirect '/peeps'
    elsif params[:peep_text]
      flash.keep[:errors] = ["Please enter some text"]
      redirect :'/peeps'
    end
  end

end
