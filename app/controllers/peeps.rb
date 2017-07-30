# Controller for peeps path
class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'/peeps/index'
  end

end
