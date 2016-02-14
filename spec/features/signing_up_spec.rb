feature 'User sign up' do
  scenario 'User can sign up and enter their details to create a new account' do
    visit '/users/new'
    fill_in "email", with: "bob@gmail.com"
    fill_in "password", with: "password"
    fill_in "password confirmation", with: "password"
    fill_in "name", with: "Bob"
    fill_in "username", with: "bob321"
    expect{ click_button "Submit" }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, bob@gmail.com"
    expect(User.first.email).to eq "bob@gmail.com"
  end

  scenario 'User cannot sign up with a mismatching password confirmation' do
    visit '/users/new'
    fill_in "email", with: "bob@gmail.com"
    fill_in "password", with: "password"
    fill_in "password confirmation", with: "wrong_password"
    fill_in "name", with: "Bob"
    fill_in "username", with: "bob321"
    expect{ click_button "Submit" }.not_to change(User, :count)

  end
end
