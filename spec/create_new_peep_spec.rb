feature 'Peeping' do
  scenario 'User can submit a new peep using a form' do

    visit '/peeps/new'

    fill_in 'body', with: 'I love re-peeping myself.'
    click_button 'Peep'

    expect(page).to have_content 'I love re-peeping myself.'
  end

  scenario 'Peeps include their author\'s username and password' do

    visit '/users/new'

    fill_in 'name', with: 'Emmett'
    fill_in 'username', with: 'flimflamjim'
    fill_in 'email', with: 'billandben@hotmail.com'
    fill_in 'password', with: 'banana'
    click_button 'Submit'

    visit '/peeps/new'

    fill_in 'body', with: 'I love re-peeping myself.'
    click_button 'Peep'

    expect(page).to have_content 'I love re-peeping myself.'
    expect(page).to have_content 'flimflamjim'
    expect(page).to have_content 'Emmett'

  end
end