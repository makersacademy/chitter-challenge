feature "Sign up" do
  scenario "a user signs up from the home page" do
    visit("/messages")
    click_button 'Sign up'
    fill_in 'username', with:'Marcellofabbri'
    fill_in 'realname', with: 'Marcello'
    fill_in 'lastname', with: 'Fabbri'
    click_button 'Submit'
    expect(page).to have_content ('Marcello Fabbri signed up as Marcellofabbri')
    click_button 'Back to Chitter'
    expect(page).to have_content ('User: Marcellofabbri')
  end
end
