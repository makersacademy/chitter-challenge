# Controller for peeps path
class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'/peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(text: params[:peep_text])
    peep.user = current_user
    peep.save
    redirect '/peeps'
  end

end
