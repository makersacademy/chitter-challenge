
feature 'Users can View the Home page' do
  
  scenario 'expect to see a welcome message' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!' 
  end

  scenario 'expect page to have a button to post a peep' do
    visit '/'
    click_button 'Post a Peep!'
    expect(page).to have_selector(:link_or_button, 'Post')
  end
end


feature 'So the user can post a new peep' do
  scenario 'it should have a place to enter a new peep' do
    visit '/peeps'
    expect(page).to have_field('peep')
  end

  scenario 'it should have a button to submit the peep' do
    visit '/peeps'
    expect(page).to have_selector(:link_or_button, 'Post')
  end
end

feature 'So the user can see the new peeps' do

  scenario 'it should show the peeps in the feed below' do
    visit '/peeps'
    expect(page).to have_content('Your Most recent peeps:')
  end

end

