feature 'Homepage loads' do
  
  scenario "User can't enter a peep if not logged in" do
    visit '/home'
    expect(page).to have_no_button 'add'
    expect(page).to have_no_button 'logout'
    expect(page).to have_button 'Login'
  end

  scenario 'User can get to Login' do
    visit '/home'
    click_button 'Login'
    expect(page).to have_content "Login to your Peeps"
  end

  scenario 'Home displays peeps' do
    peep_1 = Peep.create("Peep 1", '2020-04-09 10:52:57.960784', 'Bruce123', 'Bruce')
    peep_2 = Peep.create("Peep 2", '2020-04-10 10:52:57.960784', 'Bruce123', 'Bruce')
    visit '/add'
    fill_in 'message', with: 'This is the Newest Peep!'
    click_button 'Peep'
    expect(page).to have_content 'This is the Newest Peep! @ 2020-04-13 Peep 2 @Bruce123 2020-04-10 Peep 1 @Bruce123 2020-04-09'
  end

end