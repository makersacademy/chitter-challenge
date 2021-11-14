feature 'being able to see messages' do 
  scenario 'user can now see the messages' do
    connection = PG.connect(dbname: 'chitter_test')
    Peep.create(message: 'Welcome to Makers Academy', time: Time.now)
    visit '/peeps' 

    expect(page).to have_content 'Welcome to Makers Academy'
  end
end