feature 'Adding a new peep to Chitter' do
  scenario 'A user can add a peep to Chitter' do

    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('user_name', with: 'JD')
    fill_in('name', with: 'Josh')
    fill_in('password', with: 'password123')
    click_button('Submit')
    
    click_button('New Peep')
    fill_in('peep', with: 'new peep')
    click_button('Submit')

    expect(page).to have_content 'new peep'
    expect(page).to have_content Time.now
  end
end
