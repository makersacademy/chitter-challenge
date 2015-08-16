feature 'Peeping:' do

  scenario 'I can create a Peep' do
    user = create(:user)
    log_in(user)
    click_link 'Create some Peeps'
    fill_in 'peep_body', with: 'test peep'
    click_button 'Peep this'
    expect(page).to have_content('Your Peep was sucessfully Peeped')
  end

  scenario 'I cannot send a blank Peep' do
    user = create(:user)
    log_in(user)
    click_link 'Create some Peeps'
    fill_in 'peep_body', with: ''
    click_button 'Peep this'
    expect(page).to have_content('Sorry, there was a problem posting your peep')
  end

  scenario 'I cannot send a Peep without being signed in' do
    user = create(:user)
    visit '/peeps/new'
    fill_in 'peep_body', with: 'test peep'
    click_button 'Peep this'
    expect(page).to have_content('Sorry, peeps cannot be posted unless you are logged in')
  end

end
