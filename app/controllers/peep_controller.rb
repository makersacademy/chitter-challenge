class Chitter < Sinatra::Base
  get '/' do
    redirect to('/chitter')
  end

  get '/chitter' do
    @peeps = Peep.all(:order => [ :id.desc ])
    erb :chitter
  end

  post '/create-peep' do
    current_user.peeps.create(message: params[:message], created_at: params[Time.now])
    redirect to '/chitter'
  end
end
