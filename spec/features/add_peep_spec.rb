feature 'show landing page' do
  scenario 'welcome page' do
    visit('/')
    expect(page).to have_content('welcome to Chitter')
  end
end
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Add peep' do
  scenario 'User can post a peep on chitter' do
    visit '/peep/new'
    p page
    # expect(page).to have_content('peep')
    fill_in "peep_text", with: "Testing testing peep peep"
    click_button 'peep'
    expect(page).to have_content("Testing testing peep peep")
  end
end 