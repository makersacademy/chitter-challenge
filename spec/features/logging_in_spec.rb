feature 'Logging users in' do

  scenario 'User is redirected to the login page' do
    visit '/'
    expect(page.title).to eq "Login"
  end

end
