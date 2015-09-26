feature 'Signing up as a user:' do

  scenario 'I can sign up as a new user' do
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: 'Foogene Barrington'
    fill_in :email, with: 'foo@bar.com'
    fill_in :password, with: 'wibble'
    fill_in :handle, with: 'foobar'
    click_button 'Sign up'
    expect(User.first(name: 'Foogene Barrington').handle).to eq('foobar')
  end
  
end
