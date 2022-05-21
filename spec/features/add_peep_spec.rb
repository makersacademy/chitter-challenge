feature 'add peep' do
  scenario 'user adds new peep and can see it on feed' do
    visit '/users/new'
    fill_in('username', with: 'test name')
    fill_in('password', with: 'password123')
    click_button('Submit')

    visit '/peeps/new'
    fill_in('peep_text', with: 'This is a test message')
    click_button('Peep')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is a test message'
  end
end