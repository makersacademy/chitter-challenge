
feature 'Responding to a peep' do

  scenario 'with a successful response' do

    sign_up(name: 'Sean', username: 'seanh', email: 's@s.com',
                  password: 'password',
                  password_confirmation: 'password')
    click_button('New Peep')
    fill_in :peep, with: 'Lorem ipsum dolor si amet'
    click_button('Post Peep')
    click_button('Sign Out')
    sign_up(name: 'Steve', username: 'steve', email: 'st@s.com',
                  password: 'password',
                  password_confirmation: 'password')
    fill_in :reply, with: 'Nice point'
    click_button('Post Reply')
    expect(page).to have_content('Nice point')
    expect(page).to have_content('From Steve (steve)')
    expect(page).to have_content(Time.now.strftime("%d %B %Y, at %H:%M"))

  end

end
