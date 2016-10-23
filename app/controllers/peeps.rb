class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    new_peep = Peep.create(peep: params[:peep])
    user = current_user
    new_peep.user = user
    new_peep.save
    redirect to('/home')
  end

end
