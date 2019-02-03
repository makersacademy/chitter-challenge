feature do
  scenario 'signing up' do
    visit '/'
    fill_in 'displayname', with: 'Test Name'
    fill_in 'username', with: 'testname'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'secret'
    click_button 'Sign up'
    expect(Maker.current_user.displayname).to eq 'Test Name'
  end
end
