feature 'Signing up' do
  scenario 'a user can sign up' do
    visit '/peeps'
    click_button 'Sign up'
    fill_in 'email', with: "edina@chitter.com"
    fill_in 'password', with: "PaSsWoRd"
    fill_in 'name', with: "Edina"
    fill_in 'username', with: "edinaB"
    click_button 'Sign up'

    expect(page).to have_content("Welcome, edinaB!")
  end
end
