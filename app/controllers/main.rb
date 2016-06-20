class Chitter < Sinatra::Base
  get "/" do
    peep_list = partial(:"peep/peep", locals: { peeps: Peep.all(order: [:timestamp.desc]) })
    erb(:"peep/index", locals: { peep_formatted_list: peep_list })
  end
end
