feature 'Open the homepage' do
  scenario 'A user can view the homepage' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter!')
  end
end


feature 'Posting a peep' do
  scenario 'A user can post a peep' do
    visit('/')
    fill_in('peep', with: 'This is a new peep!')
    click_button 'Post Peep'
    expect(page).to have_content('This is a new peep!')
  end
end

