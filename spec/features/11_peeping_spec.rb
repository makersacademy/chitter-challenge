feature "maker can post a message (peep)" do
  scenario "when logged in" do
    valid_sign_up
    expect(page).to have_content 'Make a Peep!'
    fill_in :message, with: "I'm creating an app called Chitter!"
    click_button 'Peep!'
    expect(page).to have_content "I'm creating an app called Chitter!"
  end
end
