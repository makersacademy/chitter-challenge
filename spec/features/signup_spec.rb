feature 'sign up to chitter' do
  scenario 'user sign up with email and password' do
    visit '/chitter'
    fill_in 'name', with: "RebeccaMulugeta"
    fill_in 'email', with: "becc.mulugeta@gmail.com"
    fill_in 'username', with: "Becc"
    fill_in 'password', with: "password123"
    click_button 'Sign Up'
    expect(page).to have_content "Welcome Becc"
  end
end
