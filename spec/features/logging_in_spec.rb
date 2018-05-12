feature 'Logging users in' do

  scenario 'User is redirected to the login page' do
    visit '/'
    expect(page.title).to eq "Login"
  end

  scenario 'User logs in' do
    register
    visit '/'
    fill_in 'username', with: "georgeyporgey"
    fill_in 'password', with: "123@PorgeyG"
    expect(page.title).to eq "Chitter"
  end

  scenario 'User enters wron user name' do
    register
    visit '/'
    fill_in 'username', with: "georgeyporge"
    fill_in 'password', with: "123@PorgeyG"
    expect(page).to have_content "Incorrect username"
  end

  scenario 'User enters the wrong password' do
    register
    visit '/'
    fill_in 'username', with: "georgeyporgey"
    fill_in 'password', with: "123@Porgey"
    expect(page).to have_content "Incorrect password"
  end

end
