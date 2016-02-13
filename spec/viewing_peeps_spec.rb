feature 'Viewing peeps' do
  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  let!(:user) do
    User.create(name: 'Samuel Russell Hampden Joseph',
                username: 'tansaku',
                email: 'sam@makersacademy.com',
                password: 's3cr3t',
                password_confirmation: 's3cr3t')
  end

  let!(:another_user) do
    User.create(name: 'name',
                username: 'username',
                email: 'email@email.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'I can see existing peeps on the peeps page' do
    user.peeps.create(message: 'I am a peep')
    another_user.peeps.create(message: 'I am another peep')
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('I am a peep')
      expect(page).to have_content('I am another peep')
    end
  end

  scenario 'peeps are in reverse chronological order' do
    user.peeps.create(message: 'I am a peep', created_at: Time.now)
    another_user.peeps.create(message: 'I am another peep', created_at: (Time.now + 60))
    visit '/peeps'
    expect(page.find('li:nth-child(1)')).to have_content 'I am another peep'
    expect(page.find('li:nth-child(2)')).to have_content 'I am a peep'
  end
end