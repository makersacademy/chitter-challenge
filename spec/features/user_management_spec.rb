feature 'In order to sign up'  do
  
  let(:user) do
    User.new(name: 'John', 
             user_name: 'Johnnyboy', 
             email: 'john@example.com',
             password: '12345') 
             # password_confirmation: '12345')
  end

  scenario 'There is a sign up page that needs my information' do
    visit '/user/new'
    expect(page).to have_content "Enter the following to sign up."
    expect(page).to have_content "Name"
    expect(page).to have_content "User Name"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
    expect(page).to have_button "Sign up"
  end
  scenario 'when I sign up I am added to the database' do
    expect{ sign_up_a user }.to change(User, :count).by(1)
    expect(page).to have_content "#{user.user_name} is logged in."
  end
  scenario 'I must enter data for name' do
    no_name = User.new(name: '', user_name: 'Johnnyboy', email: 'john@example.com')
    expect{ sign_up_a(no_name) }.to change(User, :count).by(0)
    expect(page).to have_content "Name must not be blank"
  end
  scenario 'I must enter data for user name' do
    no_username = User.new(name: 'John', user_name: '', email: 'john@example.com')
    expect{ sign_up_a(no_username) }.to change(User, :count).by(0)
    expect(page).to have_content "User name must not be blank"
  end
  scenario 'I must enter data for email' do
    no_email = User.new(name: 'John', user_name: 'Johnnyboy', email: '')
    expect{ sign_up_a(no_email) }.to change(User, :count).by(0)
    expect(page).to have_content "Email must not be blank"
  end
  scenario 'email must be unique' do
    user = User.new(name: 'John', user_name: 'Johnnyboy', email: 'john@example.com')
    second_user = User.new(name: 'John Doe', user_name: 'Johnny', email: 'john@example.com')
    sign_up_a user
    expect{ sign_up_a second_user }.to change(User, :count).by(0)
  end
  scenario 'username must be unique' do
    user = User.new(name: 'John', user_name: 'Johnnyboy', email: 'jo@example.com')
    second_user = User.new(name: 'John Doe', user_name: 'Johnnyboy', email: 'john@example.com')
    sign_up_a user
    expect{ sign_up_a second_user }.to change(User, :count).by(0)
  end
  scenario 'password required' do
    expect{ sign_up_a(user) }.to change(User, :count).by(1)
  end

end

