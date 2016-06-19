class Chitter < Sinatra::Base
  get "/" do
    peep_list = partial(:"peep/peep", locals: { peeps: Peep.all })
    erb(:"peep/index", locals: { peep_formatted_list: peep_list })
  end
end
