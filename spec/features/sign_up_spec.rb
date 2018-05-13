feature 'signing up' do
  scenario 'valid email and password' do
    visit('/')
    click_link('Sign up')
    fill_in('email', with: 'peep.loverl337@booglemail.com')
    fill_in('password', with: 'verysecret123')
    fill_in('name', with: 'Shrimply Pibbles')
    fill_in('username', with: 'shrimplyp')
    click_button('Submit')
    expect(page).to have_current_path('/')
  end
end
