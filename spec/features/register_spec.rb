feature 'User registers themselves' do

  scenario 'Registers themselves' do
    register
    expect(page.title).to eq "Chitter"
  end

  scenario 'Fails to fill in a correct email field' do
    visit '/users/new'
    fill_in "username", with: "georgeyporgey"
    fill_in 'display_name', with: "GeorgeS"
    fill_in "email", with: "georgegmail.com"
    fill_in "password", with: "123@PorgeyG"
    fill_in "conf_password", with: "123@PorgeyG"
    click_button "Register"
    expect(page).to have_content "Not a valid email address"
  end

  scenario 'Fails to fill in a correct email field' do
    register
    register
    expect(page).to have_content "This email address is already registered"
  end

end
