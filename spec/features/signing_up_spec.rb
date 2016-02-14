feature 'User sign up' do
  scenario 'User can sign up and enter their details to create a new account' do
    visit '/users/new'
    fill_in "email", with: "bob@gmail.com"
    fill_in "password", with: "password"
    fill_in "password confirmation", with: "password"
    fill_in "name", with: "Bob"
    fill_in "username", with: "bob321"
    expect{ click_button "Submit" }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, Bob"
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
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'User cannot sign up without an email address' do
    visit '/users/new'
    fill_in "email", with: nil
    fill_in "password", with: "password"
    fill_in "password confirmation", with: "password"
    fill_in "name", with: "Bob"
    fill_in "username", with: "bob321"
    expect{ click_button "Submit" }.not_to change(User, :count)
  end

  scenario 'User cannot sign up wihout a correctly formatted email address' do
    visit '/users/new'
    fill_in "email", with: "bob@bob"
    fill_in "password", with: "password"
    fill_in "password confirmation", with: "password"
    fill_in "name", with: "Bob"
    fill_in "username", with: "bob321"
    expect{ click_button "Submit" }.not_to change(User, :count)
  end

  scenario 'User cannot sign up with an existing email address' do
    User.create(name: "Bob", username: "Bob",email: "Bob@gmail.com", password: "password", password_confirmation: "password")
    visit '/users/new'
    fill_in "email", with: "Bob@gmail.com"
    fill_in "password", with: "hello"
    fill_in "password confirmation", with: "hello"
    fill_in "name", with: "Alex"
    fill_in "username", with: "alex321"
    expect{ click_button "Submit" }.not_to change(User, :count)
    expect(current_path). to eq '/users'
    expect(page).to have_content "Email is already taken"
  end

end
