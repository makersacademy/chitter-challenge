feature 'Viewing peeps' do
  scenario 'I can see peeps people have posted on the peeps page' do
    log_in_post_peep
    click_button 'Log out'
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content("My first peep")
    end
  end
  scenario 'I can see who posted a peep' do
    log_in_post_peep
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("Gweaton")
    end
  end
  scenario 'Different posters' do
    User.create(username: 'Example',
    name: 'Ex Zample',
    email: 'user123@example.com',
    password: 'secret123',
    password_confirmation: 'secret123')

    log_in_post_peep
    within 'ul#peeps' do
      expect(page).to have_content("Gweaton")
    end
    click_button 'Log out'
    log_in(username: 'Example', password: 'secret123')
    visit '/peeps/new'
    fill_in :message, with: 'A peep from another'
    click_button 'Post peep'
    within 'ul#peeps' do
      expect(page).to have_content("A peep from another Posted by: Example")
    end
  end
end
