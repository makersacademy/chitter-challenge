feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_up(email: 'test@test.com', password: 'test', password_confirmation: 'test')
    # save_and_open_page
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
  end
  def sign_up(email:, password:, password_confirmation:)
    visit '/user/login'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign in'
  end

end
