class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  post '/peeps/new' do
    @peep = Peep.new(message: params[:peep], user_id: current_user.id)
    @peep.save!
    redirect '/peeps'
  end

end
