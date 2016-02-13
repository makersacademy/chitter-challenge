
feature 'Creating a new peep' do

  scenario 'when a user is signed in' do

    sign_up
    click_button('New Peep')
    fill_in :peep, with: 'Lorem ipsum dolor si amet'
    click_button('Post Peep')
    expect(page).to have_content('Lorem ipsum dolor si amet')
    expect(page).to have_content('Posted by Sean')
    expect(page).to have_content(Time.now.strftime("%d %B %Y, at %H:%M"))
    expect(page).to_not have_content('Sorry, you have to be signed in to send a peep')

  end

  scenario 'can\'t send a peep if you\'re not signed in' do
    visit('peeps/new')
    expect(page).to have_content('Sorry, you have to be signed in to send a peep')
  end

end
