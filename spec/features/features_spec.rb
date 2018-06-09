
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Makers can post messages to chitter' do
  scenario 'Maker can type message text into a text form' do
    visit '/peep'
    expect expect(page).to have_field("peep")
  end

  scenario 'Makers can post their peeps' do
    visit '/peep'
    fill_in('peep', with: "Test message")
    click_button 'Peep'
    expect expect(page).to have_content("Test message")
  end
end
