class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    p @peeps
    erb(:'peeps/index')
  end

  get '/peeps/add' do
    if session[:user_id].nil?
      flash[:errors] = ['You must be logged in to peep']
      redirect to('/peeps')
    end
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    peep = Peep.create(content: params[:peep_content],
                      creation_timedate: Time.now)
    peep.user = User.first(id: session[:user_id])
    peep.save!
    redirect to('/peeps')
  end
end
