feature 'Posting peeps' do

  before(:each) do
    User.create(name: 'Bo Peep',
                username: 'BoPeep789',
                email: 'bo@peep.com',
                password: 'sheepies',
                password_confirmation: 'sheepies')
    log_in(email: 'bo@peep.com', password: 'sheepies')
    visit '/peeps/new'
    fill_in('peep_text', with: 'Woke up, ate some breakfast, purred at the sheep.')
    click_button('Post')
    expect(current_path).to eq '/'
  end

  scenario 'I can post a peep' do
    expect(page).to have_content('Woke up, ate some breakfast, purred at the sheep.')
  end

  scenario 'I can see the time a peep was posted' do
    expect(page).to have_content(Time.now.strftime("%A %d %B %Y, %H:%M"))
  end

  scenario 'I can see the username of the person who posted the peep' do
    expect(page).to have_content('BoPeep789')
  end

  scenario 'I can see the name of the person who posted the peep' do
    expect(page).to have_content('Bo Peep')
  end
  
  scenario 'I cannot post a peep if I am not logged in' do
    click_button 'Log-out'
    visit '/peeps/new'
    expect(page).not_to have_content('Your post:')
    expect(page).to have_content('You need to be logged-in to post a peep.')
  end
end
