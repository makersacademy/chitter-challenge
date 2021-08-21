feature 'Users can View the Home page' do
  
  scenario 'expect to see a welcome message' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!' 
  end

  scenario 'expect page to have a button to post a peep' do
    visit('/')
    click_button 'Post a Peep!'
    expect(page).to have_field('peep')
  end

end
