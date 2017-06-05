class Chitter < Sinatra::Base
  get '/' do
    redirects to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(name:             current_user.name,
                        user_id:          current_user.id,
                        message:          params[:message])
    peep.save
    redirect to '/peeps'
  end
end
