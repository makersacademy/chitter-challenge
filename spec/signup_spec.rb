feature 'new maker signup' do
  scenario 'a new maker can sign up with a username, email and password' do
    visit '/makers/sign_up'
    fill_in 'username', with: 'sallywag'
    fill_in 'email', with: 'sally@dogs.com'
    fill_in 'password', with: 'sally1'
    click_button 'sign up'
    expect(page).to have_content 'sallywag'
  end
end
