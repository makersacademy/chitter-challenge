class Chitter

  register Sinatra::Reloader

  post '/peeps' do
    content = params["content"]
    Peep.create(content: content)
    redirect to '/'

  end

end
