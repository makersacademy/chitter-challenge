class Chitter < Sinatra::Base
  get '/' do
    redirect to('/chitter')
  end

  get '/chitter' do
    @peeps = Peep.all_in_reverse_order
    erb :chitter
  end

  post '/create-peep' do
    current_user.peeps.create(message: params[:message])
    redirect to '/chitter'
  end
end
