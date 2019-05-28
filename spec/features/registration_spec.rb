feature 'registration' do
  scenario 'new user' do
    visit '/users/new'
    fill_in('username', with: 'peepstar')
    fill_in('name', with: 'Peter')
    fill_in('email', with: 'peep4peep@chitter.co.uk')
    fill_in('password', with: 'peepispeepbackwards')
    click_button('Submit')

    expect(page).to have_content "Welcome, Peter!"
  end
end