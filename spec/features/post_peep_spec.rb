# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting a peep' do
  before do
    visit '/post'
  end

  scenario 'create a peep' do
    expect(page).to have_content "What would you like to say?"
    fill_in 'peep', with: "Hi there"
    click_button "Peep"
    expect(page).to have_content "Peep posted"
  end
end
