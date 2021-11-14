feature 'being able to see messages' do 
  scenario 'user can now see the messages' do
    Peep.create(message: 'Welcome to Makers Academy')
    visit '/peeps' 

    expect(page).to have_content 'Welcome to Makers Academy'
  end
end