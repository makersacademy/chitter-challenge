feature 'User sign in' do
  before(:all) do
    Peep.create(text: 'I am feeling good')
  end
  let!(:user) do
    User.create(username: 'myusername',
    email: 'myemail@email.com',
    name: 'myname',
    password: 'mypassword')
  end

  scenario 'with correct credentials' do
    visit '/'
    fill_in :username,      with: 'myusername'
    fill_in :password,      with: 'mypassword'
    click_button "Login"
    expect(page).to have_content "Welcome myname!"
  end

  scenario 'with incorrect credentials' do
    visit '/'
    fill_in :username,      with: 'myusername'
    fill_in :password,      with: 'mypasswordfalse'
    click_button "Login"
    expect(current_path).to eq '/user'
    expect(page).to have_content "Username or password not valid, try again"
  end
end
