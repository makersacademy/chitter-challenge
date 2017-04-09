feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(peep: 'Testers Academy')
    visit('/peeps')
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Testers Academy')
      expect(page).to have_content(Time.now)
    end
  end
end

feature 'I can go to sign in page' do
  scenario 'Clicking button to go to sign in page' do
    visit('/peeps')
    click_button 'Sign in'
    expect(current_path).to eq '/sessions/new'
  end
end

feature 'I can go to the sign up page' do
  scenario 'Clicking button to go to sign up page' do
    visit('/peeps')
    click_button 'Sign up'
    expect(current_path).to eq '/users/new'
  end
end
