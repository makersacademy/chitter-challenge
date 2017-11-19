class App < Sinatra::Base
  get '/tags/:id' do |id|
    tag = Tag.first(id: id)
    if tag
      erb(:'peeps/peeps', locals: { peeps: tag.peeps, header: "##{tag.name}" })
    else
      status(404)
    end
  end
end
