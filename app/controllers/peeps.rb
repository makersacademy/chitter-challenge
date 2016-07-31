class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps/'
  end

  get '/peeps/' do
    @peeps = Peep.all(order: [:id.desc])
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    peep.save
    redirect '/peeps/'
  end

end
