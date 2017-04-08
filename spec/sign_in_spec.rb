feature 'signing in' do
  scenario 'maker can sign in with username and password' do
    Maker.create(username: 'sallywag', email: 'sally@dogs.com', password: 'sally1')
    visit '/makers/sign_in'
    fill_in 'username', with: 'sallywag'
    fill_in 'password', with: 'sally1'
    click_button 'sign in'
    expect(page).to have_content 'sallywag'
  end
end
