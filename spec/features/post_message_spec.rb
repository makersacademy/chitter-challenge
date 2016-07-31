feature 'post message' do
  scenario 'a user can post a message for others to see' do
    sign_up
    visit '/peeps'
    fill_in :message, with: 'My first peep!'
    click_button 'Peep'
    expect(page).to have_content 'My first peep!'
  end

  scenario 'peeps include the users full_name and user_name' do
    sign_up
    visit '/peeps'
    fill_in :message, with: 'My first peep!'
    click_button 'Peep'
    expect(page).to have_content 'Tim (TC86) My first peep!'
  end

  scenario 'peeps include the time' do
    allow(Time).to receive(:new).and_return(Time.parse("2016-07-31 17:23:49 +0100"))
    sign_up
    visit '/peeps'
    fill_in :message, with: 'My first peep!'
    click_button 'Peep'
    expect(page).to have_content '31/07/2016 17:23 Tim (TC86) My first peep!'
  end

  scenario 'a user tries to peep without being logged in' do
    visit '/peeps'
    fill_in :message, with: 'My first peep!'
    click_button 'Peep'
    expect(page).to have_content 'You need to log in to send a peep'
  end

end
