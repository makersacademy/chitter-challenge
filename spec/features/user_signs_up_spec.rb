require 'user'
feature 'User signs up' do

  scenario 'when a new user is visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, nickName!')
    expect(User.first.email).to eq('test@test.com')
    expect(User.first.name).to eq('Test Test')
    expect(User.first.user_name).to eq('nickName')
  end

  def sign_up(email = 'test@test.com', name = 'Test Test',
              user_name = 'nickName', password = '123456',
              password_confirmation = '123456')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :user_name, with: user_name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

end