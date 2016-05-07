class Chitter < Sinatra::Base

  get '/peep' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep/new' do
    peep = Peep.create(content: params[:content])
    peep.user = current_user
    if peep.save
      redirect '/peep'
    else
      flash.keep[:errors] = "only users can peep"
      redirect '/session/new'
    end
  end

end
