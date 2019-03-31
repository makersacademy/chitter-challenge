feature 'welcome message' do
  scenario 'user visits home page' do
    visit('/chitter')
    expect(page).to have_content('Welcome to Chitter')
  end
end

feature 'add new peep' do
  scenario 'user can post new peep to Chitter' do
    visit('/chitter')
    click_button('New peep')
    fill_in('peep_content', with: 'I am eating lunch')
    click_button('Post')
    expect(page).to have_content('I am eating lunch')
  end
end
