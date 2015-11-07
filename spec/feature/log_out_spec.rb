feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
  end
  def sign_in(email:, password:)
    visit '/user/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sing up'
  end

end
