feature 'View Homepage' do
  scenario 'User visits Hompage and sees Chitter, Email and Login' do
    visit '/'
    expect(page).to have_content("Chitter")
    expect(page).to have_content("Email")
    expect(page).to have_field("Email") 
    expect(page).to have_content("Password")
    expect(page).to have_field("Password") 
    expect(page).to have_button("Log in")
  end
end