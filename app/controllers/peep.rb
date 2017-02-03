class ChitterApp < Sinatra::Base

  helpers do
    def recent_peeps
      @recent_peeps ||= Peep.last(Peep::MAX_PEEP_PER_PAGE)
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = current_user.peeps.create(peep_text: params[:peep_text])
    if peep.save
      redirect '/'
    else
      flash[:error] = peep.errors.full_messages
      redirect '/peeps/new'
    end
  end

end
