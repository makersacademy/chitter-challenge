
require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmarks_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end

def add_to_database( i=0 )
  peep_list = 
    [{peep: 'first', username: 'king_of_universe', timestamp: Time.mktime(-2280, 6, 23, 16, 20).to_i},
    {peep: "got to do the stupid festival today #CantBeAsked", username: 'sargons_bff', timestamp: Time.mktime(-550).to_i},
    {peep: "Guys i just found this totally sick temple come check it out", username: 'sargons_bff', timestamp: Time.mktime(-540).to_i},
    {peep: "@sargons_bff mine", username: 'the_golden_C', timestamp: Time.mktime(-539).to_i}]
  i = peep_list.length if i > peep_list.length or i == 0
  (0...i).each { |i| Peep.create(peep: peep_list[i][:peep], username: peep_list[i][:username], timestamp: peep_list[i][:timestamp]) }
end