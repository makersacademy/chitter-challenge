class Chitter < Sinatra::Base

  post '/peeps' do
    message = params['message']
    user = params['user']
    Peep.create(:message => message, :name => current_user.name, :username => current_user.username, :time => Time.now)
    redirect to('/')
  end

end
