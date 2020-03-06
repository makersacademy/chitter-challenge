feature 'creating peeps' do
  scenario 'a user can create a peep' do
    visit '/users/new'
    fill_in('name', with: 'James Bond')
    fill_in('username', with: 'golden_gun')
    fill_in('email', with: 'james_bond_007@mi6.com')
    fill_in('password', with: 'ihatedoctorno')
    click_button('Submit')
    
    expect(current_path).to eq '/peeps'

    click_on('create_peep')
    expect(current_path).to eq '/peeps/new'

    fill_in('content', with: 'The world is not enough')
    click_button('Submit')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("The world is not enough")
  end
end
