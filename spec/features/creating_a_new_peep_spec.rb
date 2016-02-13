
feature 'Creating a new peep' do

  scenario 'when a user is signed in' do

    sign_up
    click_button('New Peep')
    fill_in :peep, with: 'Lorem ipsum dolor si amet'
    click_button('Post Peep')
    expect(page).to have_content('Lorem ipsum dolor si amet')
    expect(page).to have_content('Posted by Sean')

  end

  scenario 'displays the date and time the peep was posted' do

    sign_up
    click_button('New Peep')
    fill_in :peep, with: 'Lorem ipsum dolor si amet'
    click_button('Post Peep')
    expect(page).to have_content(Time.now.strftime("%d %B %Y, at %H:%M"))

  end

end
