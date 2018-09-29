# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Add peep' do
  scenario 'User can post a peep on chitter' do
    visit '/peeps/new'
    fill_in "peep_text", with: "Testing testing peep peep"
    click_button 'peep'
    expect(page).to have_content("Testing testing peep peep")
  end
end 