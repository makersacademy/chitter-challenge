class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all.sort {|peep1, peep2| peep2.created_at <=> peep1.created_at}
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(peep: params[:peep], user: current_user, created_at: Time.now)
    if peep.id.nil?
       flash[:errors] = peep.errors.full_messages
       redirect to "/peeps/new"
     else
       redirect to "/peeps"
     end
  end
end
