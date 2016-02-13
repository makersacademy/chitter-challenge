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
  let!(:message) { 'I am a peep' }

  let!(:another_user) do
    User.create(name: 'name',
                username: 'username',
                email: 'email@email.com',
                password: 'password',
                password_confirmation: 'password')
  end
  let!(:another_message) { 'I am another peep' }

  let(:time) { Timecop.freeze(Time.new(2016,2,13,20,45)) }

  scenario 'I can see existing peeps on the peeps page' do
    user.peeps.create(message: message)
    another_user.peeps.create(message: another_message)
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content(message)
      expect(page).to have_content(another_message)
    end
  end

  scenario 'peeps are in reverse chronological order' do
    user.peeps.create(message: message, created_at: time)
    another_user.peeps.create(message: 'I am another peep', created_at: (time + 60))
    visit '/peeps'
    expect(page.find('li:nth-child(1)')).to have_content(another_message)
    expect(page.find('li:nth-child(2)')).to have_content(message)
  end

  # As a maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario 'I can see the time at which a peep was made' do
    user.peeps.create(message: message)
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('peeped at 20:45 13.02.2016')
    end
  end
end