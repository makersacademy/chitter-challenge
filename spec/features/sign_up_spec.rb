feature 'FEATURE: sign up' do

  scenario 'Can click to sign up from home page' do
    visit('/')
    click_link('sign_up')
    expect(page.current_path).to eq "/users/new"
  end

  scenario 'Can enter user details and create new user' do
    visit('/')
    click_link('sign_up')
    save_and_open_page
    fill_in :name, with: 'James T. Kirk'
    fill_in :email, with: 'test@test.com'
    fill_in :user_name, with: 'TheShat'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_button('submit_sign_up')
    expect(User.all.count).to eq 1
  end

end
