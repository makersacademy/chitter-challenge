feature "Homepage" do
  scenario "has a link to sign up" do
    visit '/'
    click_button 'Sign up'
    expect(current_path).to eq '/sign_up'
    fill_in 'name', with: "John Doe"
    fill_in 'username', with: "JDoe123"
    fill_in 'email', with: 'johndoe@gmail.co.uk'
    fill_in 'password', with: "Password123"
    click_button 'Create account'
    expect(current_path).to eq '/'
  end
end
