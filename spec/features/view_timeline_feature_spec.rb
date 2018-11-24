feature 'user registration' do
  xscenario 'a user can sign up to chitter' do
    visit '/peeps'
    click_button 'Sign Up'
    expect(current_path).to eq '/users/new'
    fill_in('name', with: 'Test Name')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('username', with: 'my_username')
    click_button('Submit')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome, my_username"
    click_button('Post Peep')
    expect(current_path).to eq '/peeps/:id/new'
    fill_in('Post Peep', with: 'test peep')
    click_button('Submit')
    expect(current_path).to eq 'peeps'
    expect(page).to have_content 'test peep'
  end
end
