feature 'User sign in' do

  let(:user) {build :user}

  before do
    user.save
  end

  scenario 'with corrent credentials' do
    sign_in(user)
    expect(page).to have_content "Hello, #{user.username}"
  end

  # def sign_in(user)
  #   visit '/sessions/new'
  #   expect(page.status_code).to eq(200)
  #   fill_in :username, with: user.username
  #   fill_in :password, with: user.password
  #   click_button 'Sign in'
  # end

end
