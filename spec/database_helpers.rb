require_relative '../lib/users.rb'
require_relative '../lib/peeps.rb'
require 'pg'

ENV['ENVIRONMENT'] = 'test'

# def persisted_data(id:)
#   connection = PG.connect(dbname: 'bookmarks_manager_test')
#   result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
#   result.first
# end

def add_peeps_to_database( i=0 )
  peep_list = 
    [{peep: 'first', username: 'king_of_universe', timestamp: Time.mktime(-2280, 6, 23, 16, 20).to_i},
    {peep: "got to do the stupid festival today #CantBeAsked", username: 'sargons_bff', timestamp: Time.mktime(-550).to_i},
    {peep: "Guys i just found this totally sick temple come check it out", username: 'sargons_bff', timestamp: Time.mktime(-540).to_i},
    {peep: "@sargons_bff mine", username: 'the_golden_C', timestamp: Time.mktime(-539).to_i},
    {peep: "all ur base are belong to ME BITCHES #KissMyBootPeasants #LivingTheGREATlife", username: 'Bucephala_gonna_getcha', timestamp: Time.mktime(-330, 11, 15, 11, 15).to_i}]
  i = peep_list.length if i > peep_list.length or i == 0
  (0...i).each { |i| Peep.create(peep: peep_list[i][:peep], username: peep_list[i][:username], timestamp: peep_list[i][:timestamp]) }
end

def add_users_to_database( i=0 )
  user_list = 
    [{email: "sargon_akkad@compuserve.com", password: 'Akkadia4Evar', username: 'king_of_universe', screenname: 'Sargon of Akkad'},
    {email: "nabonidus_56@aol.com", password: 'SinMoonsMarduk', username: 'sargons_bff', screenname: 'Nabonidus'},
    {email: "cyrus_2_persia@aol.com", password: 'OpulenceIOwnEverything', username: 'the_golden_C', screenname: 'Cyrus II of Persia'},
    {email: "alexander_56@yahoo.com", password: 'Akkadia4Evar', username: 'Bucephala_gonna_getcha', screenname: 'Alexander III of Macedon'}]
  i = user_list.length if i > user_list.length or i == 0

  # connection = PG.connect(dbname: 'chitter')

  (0...i).each { |i| User.create(email: user_list[i][:email], password: user_list[i][:password], username: user_list[i][:username], screenname: user_list[i][:screenname])}
end

def quick_set()
  add_peeps_to_database
  add_users_to_database
end