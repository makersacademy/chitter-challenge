feature 'login' do
  scenario 'existing user can log in' do
    sign_up
    visit '/peeps'
    click_button 'Log in'
    fill_in('email', :with => 'a@dotmail.com')
    fill_in('password', :with => 'password1')
    click_button 'Submit'
    expect(page).to have_content 'Welcome, Alex'
  end

  scenario 'wrong details used' do
    sign_up
    visit '/peeps'
    click_button 'Log in'
    fill_in('email', :with => 'a@dotmail.com')
    fill_in('password', :with => 'password2')
    click_button 'Submit'
    expect(page).to have_content 'Email or password was incorrect'
  end
end
