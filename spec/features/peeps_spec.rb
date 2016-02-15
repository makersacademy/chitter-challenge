feature 'viewing and adding peeps' do

  scenario 'A user can see a list of peeps' do
    visit '/'
    expect(page).to have_content('Peeps')
    expect(page).not_to have_content('Create Peep')
  end

  scenario 'a user can create a peep' do
    sign_up
    visit '/'
    expect(page).to have_content('Create Peep')
  end

  scenario 'when a user creates a peep it is displayed on the main page' do
    sign_up
    create_peep('Hello')
    expect(page).to have_content('Hello')
  end

  scenario 'a user can see the time a peep was created' do
    sign_up
    create_peep('I am a peep')
    expect(page).to have_content("Written on #{Time.now.strftime('%m/%d/%Y')} at #{Time.now.strftime('%I:%M%p')}")
  end

end
