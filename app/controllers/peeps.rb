class App < Sinatra::Base
  get '/peeps' do
    erb(:'peeps/peeps', locals: { peeps: Peep.all })
  end

  get '/peeps/new' do
    current_user ? erb(:'peeps/new') : status(401)
  end
  
  post '/peeps' do
    peep = Peep.new(content: params[:content], user_id: session[:user_id])
    if peep.save
      redirect('/peeps')
    else
      flash.now[:errors] = "Peep cannot be blank"
      erb(:'peeps/new')
    end
  end
end
