feature 'being logged in' do
  scenario 'User posts tweets with their username and name' do 
    register_test
    fill_in('New_peep', with: 'This is a test peep')
    click_button 'Submit new peep'
    expect(page).to have_content('testy mctestface (test123) at')
    expect(page).to have_content('This is a test peep')
  end
  scenario 'not being logged in posts as guest' do
    visit '/peeps'
    fill_in('New_peep', with: 'This is a test peep')
    click_button 'Submit new peep'
    expect(page).to have_content('Guest at')
    expect(page).to have_content('This is a test peep')
  end
end


