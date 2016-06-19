

feature "Can sign up to Chitter" do

  scenario "User can sign up to chitter" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Dave")
    expect(User.first.email).to eq("test@test.com")
  end


  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end

feature 'User sign in' do

  let!(:user) do
    User.create(user_name: 'Dave',
    password: 'password1')
  end

  scenario 'with correct credentials' do
    sign_in(user_name: user.user_name,   password: user.password)
    expect(page).to have_content "Welcome, #{user.user_name}"
  end

end

feature 'User signs out' do

  before(:each) do
    User.create(user_name: 'Dave',
                password: 'password1')
  end

  scenario 'while being signed in' do
    sign_up
    sign_in(user_name: 'Dave', password: 'password1')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
