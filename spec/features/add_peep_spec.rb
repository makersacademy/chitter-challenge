feature 'Homepage' do
  scenario 'visiting the homepage' do
    visit '/chitter'
    expect(page).to have_content 'Welcome to Chitter'
  end
end

feature 'add peep' do
  scenario 'user can post peep to Chitter' do
    visit '/chitter'
    click_button 'New Peep'
    fill_in :peep_content, with: 'I am working'
    click_button 'Post'
    expect(page).to have_content 'I am working'
  end
end
