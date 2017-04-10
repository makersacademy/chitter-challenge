feature 'signing in' do

  scenario 'maker can sign in with username and password' do
    sign_in
    expect(page).to have_content 'sallywag'
  end

  scenario "can't sign in with wrong password" do
    sally = Maker.create(username: 'sallywag', email: 'sally@dogs.com', password: 'sally1')
    visit '/sessions/sign_in'
    fill_in 'username', with: 'sallywag'
    fill_in 'password', with: 'sally2'
    click_button 'sign in'
    expect(page).to have_content 'wrong username or password'
  end

end
