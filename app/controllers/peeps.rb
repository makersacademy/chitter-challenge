class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'/peeps/new_peep'
  end

  post '/peeps' do
    @peep = Peep.create(peep: params[:peep], user_id: current_user.id)
  end

  get '/peeps' do
    @peeps = Peep.reverse_order
    erb :'peeps/index'
  end
end
