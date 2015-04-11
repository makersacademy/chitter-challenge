class Chitter

  post '/peeps' do
    message = params['message']
    Peep.create message: message
    redirect to '/'
  end

end
