feature 'index page' do

  scenario 'user can sign up to Chitter' do
    visit '/'
    click_button 'Sign up'
    fill_in('name', with: 'Gordon Brown')
    fill_in('email', with: 'gbrown@gmail.com' )
    fill_in('password', with: 'secret')
    fill_in('username', with: 'gbrown')
    click_button 'Submit'
    expect(page).to have_content 'Hello Gordon'
  end

end
