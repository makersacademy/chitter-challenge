feature 'FEATURE: sign up' do

  scenario 'Can click to sign up from home page' do
    visit('/')
    click_link('sign_up')
    expect(page.current_path).to eq "/users/new"
  end

  scenario 'Can enter user details and create new user' do
    # visit('/')
    # click_link('sign_up')
    # fill_in :name, with: 'James T. Kirk'
    # fill_in :email, with: 'test@test.com'
    # fill_in :user_name, with: 'TheShat'
    # fill_in :password, with: 'password'
    # fill_in :password_confirmation, with: 'password'
    # click_button('submit_sign_up')
    sign_up('James T Kirk', 'JTK@test.com', 'TheShat', 'password', 'password')
    expect(User.all.count).to eq 1
  end

  scenario 'Must enter a name' do

  end

end
