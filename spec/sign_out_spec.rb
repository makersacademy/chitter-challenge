feature 'User signs out' do

  before do
    User.create(
      email: 'zack@zack.com',
      password: 'zackpw',
      name: 'zack',
      username: 'zacku'
    )
  end

  scenario 'when signed in' do
    visit '/sessions/new'
    fill_in :email, with: 'zack@zack.com'
    fill_in :password, with: 'zackpw'
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_content 'goodbye'
  end
end

