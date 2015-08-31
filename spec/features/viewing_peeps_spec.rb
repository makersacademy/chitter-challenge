feature 'Viewing peeps' do

  scenario ' I can see existing peeps on the main page' do
    user = create :user
    sign_in(user)
    user.peeps.create(message: 'Test message', time: '14:11')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Test message')
    end
  end

  scenario ' I can see time stamps on peeps' do
    user = create :user
    sign_in(user)
    user.peeps.create(message: 'Test message', time: '14:11')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('14:11')
    end
  end

  scenario 'I cannot peep if not logged in' do
    visit '/peeps/new'
    fill_in :message, with: "Test message"
    click_button 'Post'
    expect(page.status_code).to eq 200
    expect(page).to have_content('You must be logged in to peep')
  end

  def sign_in(user)
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end
end
