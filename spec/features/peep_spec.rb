feature 'Peeps' do

  let! :user do
    User.create(username: 'OMGDuke', name: 'Alex',
                email: 'name@email.com', password: '12345',
                password_confirmation: '12345')
  end

  scenario 'I can see existing peeps on the homepage page' do
    multi_peep
    expect(page.status_code).to eq 200
    within 'ul#messages' do
      expect(page).to have_content 'So Chitter'
      expect(page).to have_content 'Much Peep'
      expect(page).to have_content 'Wow'
    end
  end

  scenario 'submits a new peep' do
    sign_in(username: user.username, password: user.password)
    visit '/peeps/new'
    fill_in 'message', with: 'Wow'
    click_button 'submit'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Wow'
  end

  scenario 'can\'t peep when not logged in' do
    sign_in(username: user.username, password: user.password)
    click_button 'Sign out'
    visit '/peeps/new'
    expect(page).to have_content 'You must be logged in to Peep'
  end
end
