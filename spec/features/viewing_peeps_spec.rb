feature 'Viewing peeps' do
  scenario 'Users can see peeps on homepage without logging in' do
    sign_up
    sign_in(email: 'marsupilami@marsu.com', password: 'qwerty')
    visit '/peeps/new'
    fill_in('title', with: 'Marsu is testing')
    fill_in('body', with: 'Very first peep')
    click_button 'Create peep'
    click_button 'Log out'

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Very first peep')
    end
  end
end
