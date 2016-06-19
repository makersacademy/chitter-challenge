class Chitter < Sinatra::Base
  get "/hashtag/:name" do
    hashtag = Hashtag.first(name: params[:name])
    peeps = hashtag ? hashtag.peeps : []
    peep_list = partial(:"peep/peep", locals: { peeps: peeps })
    erb(:"hashtag/index", locals: { peep_formatted_list: peep_list })
  end
end
