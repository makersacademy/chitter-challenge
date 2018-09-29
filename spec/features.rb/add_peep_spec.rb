feature 'adding peeps-' do
  scenario 'I want to be able register then add a peep' do
    visit '/register'
    fill_in 'username', with: 'FrodoSwaggins'
    fill_in 'firstname', with: 'Frodo'
    fill_in 'lastname', with: 'Baggins'
    fill_in 'email', with: 'the1ring@gmail.com'
    fill_in 'password', with: 'ilovetheshire'
    click_button 'Register'
    fill_in 'peep', with: "THEY'RE TAKING THE HOBBITS TO ISENGARD"
    click_button 'Peep'
    expect(page).to have_content "THEY'RE TAKING THE HOBBITS TO ISENGARD"
  end

  scenario 'I want to be able to log in then add a peep' do
    User.create user: 'GIMLITHEGREAT', firstname: 'gimli', lastname: 'son of gloin', email: 'outscoredpointyear@gmail.com', password: 'erebor'
    visit '/'
    binding.pry
    fill_in 'username', with: 'GIMLITHEGREAT'
    fill_in 'password', with: 'erebor'
    click_button 'sign in'
    fill_in 'peep', with: "THEY'RE TAKING THE HOBBITS TO ISENGARD"
    click_button 'Peep'
    expect(page).to have_content "THEY'RE TAKING THE HOBBITS TO ISENGARD"
  end

  scenario "I don't want to be able to post if not logged in" do
    visit '/'
    expect(page).to_not have_button "peep"
  end

  scenario 'I want to see the time I posted it at' do
    allow(Time).to receive(:now).and_return(Time.new(2018,02,02,12,0,0,"+09:00"))
    visit '/'
    fill_in 'username', with: 'GIMLITHEGREAT'
    fill_in 'password', with: 'erebor'
    click_button 'sign in'
    fill_in 'peep', with: "My PRECIOUS!"
    click_button 'Peep'
    expect(page).to have_content "12:00PM 2 Feb 18"
  end
end
