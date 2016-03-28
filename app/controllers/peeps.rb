class Chittr < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peep' do
    peep = Peep.create(body: params[:body])
    peep.user = current_user
    peep.save
    redirect to :'/'
  end

end
