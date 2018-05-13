feature 'Posting a new peep' do
  scenario 'displays new peep page' do
    create_user
    visit '/chitter'
    click_on 'Sign in'
    fill_in 'username', with: 'Yoncé'
    fill_in 'password', with: 'lemonade'
    click_button 'Sign in'
    click_on 'New peep'
    expect(page).to have_content('Text')
  end

  scenario 'post a new peep' do
    create_user
    visit '/chitter'
    click_on 'Sign in'
    fill_in 'username', with: 'Yoncé'
    fill_in 'password', with: 'lemonade'
    click_button 'Sign in'
    click_on 'New peep'
    fill_in 'text', with: 'I am hungry'
    click_button 'Post'
    expect(page).to have_content('I am hungry')
  end

  scenario 'Cannot peep unless logged in' do
    visit '/chitter'
    click_on 'New peep'
    expect(page).to have_content('Sign in before you peep!')
  end
end
