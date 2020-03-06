feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'James Bond')
    fill_in('username', with: 'golden_gun')
    fill_in('email', with: 'james_bond_007@mi6.com')
    fill_in('password', with: 'ihatedoctorno')
    click_button('Submit')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, James Bond'
  end
end
