feature 'Logging users in' do

  scenario 'User is redirected to the login page' do
    visit '/'
    expect(page.title).to eq "Login"
  end

  scenario 'User logs in' do
    visit '/'
    fill_in 'username', with: "georgeyporgey"
    fill_in 'password', with: "123@PorgeyG"
    expect(page.title).to eq "Chitter"
  end

end
