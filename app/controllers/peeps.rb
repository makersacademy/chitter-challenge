class ChitterApp < Sinatra::Base

  get '/peeps/peepdeck' do
    @peeps = Peep.all.reverse
    erb :'peeps/peepdeck'
  end

  post '/peeps/peepdeck' do
    new_peep = Peep.create(peep_text: params[:peep], user_id: current_user.id)
    redirect 'peeps/peepdeck'
  end

end
