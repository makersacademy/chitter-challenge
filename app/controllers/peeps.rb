class Chitter < Sinatra::Base 

  get '/peeps' do 
    @peeps = Peep.all 
    erb :'peeps/index'
  end

  post '/peeps' do 
    time = Time.now.strftime("%H:%M:%S %Y-%m-%d")
    # peep = Peep.new(content: params[:content], time: time)
    # current_user.peeps << peep 
    # peep.save
    Peep.create(content: params[:peep] , time: time)
    redirect to('/peeps')
  end

  get '/peeps/new' do 
    erb :'peeps/new'
  end
  
end