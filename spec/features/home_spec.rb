feature 'Homepage loads' do
  
  scenario 'User can enter a peep' do
    visit '/home'
    click_button 'add'
    fill_in 'message', with: 'This is the first Peep!'
    click_button 'Peep'
    expect(page).to have_content 'This is the first Peep!'
  end

  scenario 'User can Login' do
    visit '/home'
    click_button 'Login'
    fill_in 'username', with: "Bruce"
    fill_in 'password', with: "password"
    click_button 'log_in'
    expect(page).to have_content "Peeper: Bruce"
    expect(page).not_to have_button "Login"
  end

  scenario 'Home displays peeps' do
    peep_1 = Peep.create("Peep 1", '2020-04-09 10:52:57.960784')
    peep_2 = Peep.create("Peep 2", '2020-04-10 10:52:57.960784')
    visit '/add'
    fill_in 'message', with: 'This is the Newest Peep!'
    click_button 'Peep'
    expect(page).to have_content 'This is the Newest Peep! 2020-04-11 Peep 2 2020-04-10 Peep 1 2020-04-09'
  end

end