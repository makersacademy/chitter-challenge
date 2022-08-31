require 'pg'

feature 'Viewing the homepage' do
  scenario 'The page title is visible' do 
    visit ('/')

    expect(page).to have_content 'Welcome to Chitter'
  end
end 

feature 'View all Peep content' do
  scenario 'A user can view content of all previous Peeps' do
    connection = PG.connect(dbname: 'chitter_test')

 
    Peep.new(content: 'Elon who?')
    Peep.new(content: 'COYS')
    Peep.new(content: '123456789')
    
    visit ('/peeps')

    expect(page).to have_content 'Elon who?'
    expect(page).to have_content 'COYS'
    expect(page).to have_content '123456789'
  end
end

# feature 'View Peep posting time' do
#   scenario 'A user can see what time the Peep was posted' do
#     Timecop.freeze(specific_datetime) do
#     specific_datetime = 2022-05-1421475631694501
#     connection = PG.connect(dbname: 'chitter_test')

#     Peep.new(content: 'Elon who?')
#     Peep.new(content: 'COYS')
#     Peep.new(content: '123456789')
    
#     visit ('/peeps')

#     expect(page).to have_content("created_at: #{specific_datetime.to_s}")
#     end
#   end
# end
   
