require 'user'

feature 'sign in' do
  scenario 'user can sign in if registered' do

    User.add(name: 'Pete', username: 'pja', email: 'test@test.com', password: '1234')
    User.log_out

    visit '/'
    click_button 'Sign In'
    expect(current_path).to eq '/login'
    fill_in('username', with: 'pja')
    fill_in('password', with: '1234')
    click_button 'Sign In'

    expect(current_path).to eq '/'
    expect(page).to have_content('Hi Pete! Send a peep below')
    expect(page).to have_content('Sign Out')
  end
end
