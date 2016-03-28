class Chitter < Sinatra::Base
  post '/peep/new' do
    peep = Peep.new(message: params[:message], timestamp: Time.now.strftime('%d/%m/%Y %H:%M'))
    current_user.peeps << peep
    peep.save
    redirect to '/home'
  end

end
