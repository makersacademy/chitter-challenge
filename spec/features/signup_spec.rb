feature "Signup" do
  scenario "sends the user to login after successfull signup" do
    visit '/signup'
    fill_in 'name', with: "John Doe"
    fill_in 'username', with: "JDoe123"
    fill_in 'email', with: 'johndoe@gmail.co.uk'
    fill_in 'password', with: "Password123"
    click_button 'Create account'
    expect(current_path).to eq '/login'
  end

  scenario "confirms a failure message when the user adds incorrect details" do
    visit '/signup'
    fill_in 'name', with: "John Doe"
    fill_in 'username', with: "JDoe123"
    fill_in 'email', with: 'johndoe@gmail.co.uk'
    fill_in 'password', with: "this"
    click_button 'Create account'
    expect(current_path).to eq '/failure'
    expect(page).to have_content "Invalid details"
  end
end
