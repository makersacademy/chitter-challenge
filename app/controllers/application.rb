get '/' do
  @peeps = Peep.all
  erb :index
end

def get_peep_maker(peep, id)
  Maker.get(id).username
end