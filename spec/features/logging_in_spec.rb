feature 'Logging users in' do

  scenario 'User is redirected to the login page' do
    visit '/'
    expect(page.title).to eq "Login"
  end

  scenario 'User logs in' do
    register
    click_button "Logout"
    visit '/'
    fill_in 'email', with: "george@gmail.com"
    fill_in 'password', with: "123@PorgeyG"
    click_button "Login"
    expect(page.title).to eq "Chitter"
  end

  scenario 'User enters wron user name' do
    register
    click_button "Logout"
    visit '/'
    fill_in 'email', with: "georgegmail.com"
    fill_in 'password', with: "123@PorgeyG"
    click_button "Login"
    expect(page).to have_content "Incorrect username"
  end

  scenario 'User enters the wrong password' do
    register
    click_button "Logout"
    visit '/'
    fill_in 'email', with: "george@gmail.com"
    fill_in 'password', with: "123@Porgey"
    click_button "Login"
    expect(page).to have_content "Incorrect password"
  end

end
