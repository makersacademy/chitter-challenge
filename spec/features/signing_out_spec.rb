feature 'User signs out' do

  let(:user) {build :user}

  before do
    user.save
  end

  scenario 'while being signed in' do
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('See you later!')
    expect(page).not_to have_content('Hello, bobiscool!')
  end

end
