feature 'Sending a peep' do
  scenario 'user can send a peep' do
    visit '/peeps'
    click_button 'New'
    fill_in 'message', with: "Hello there"
    click_button "Send"

    expect(page).to have_content("Hello there")
  end
end
