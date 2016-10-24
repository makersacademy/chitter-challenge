class Chitter < Sinatra::Base
  
  get '/' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :'index'
  end

  post '/' do
    peep = Peep.create(peep_text: params[:peep_text], user_id: session[:user_id])
    if peep.save
      peep.save
      redirect to('/')
    else
      flash.now[:errors] = peep.errors.full_messages
      erb :'peeps/new'
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end
end
