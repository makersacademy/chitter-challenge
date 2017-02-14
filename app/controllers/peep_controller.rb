class Chitter < Sinatra::Base
  get '/' do
    redirect to('/chitter')
  end

  get '/chitter' do
    @peeps = Peep.all_in_reverse_order
    erb :chitter
  end

  post '/create-peep' do
    Peep.create(message: params[:message], user_id: current_user.id)
    redirect to '/chitter'
  end
end
