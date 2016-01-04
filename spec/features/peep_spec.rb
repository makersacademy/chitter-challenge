feature 'Posting a message' do
  let!(:user) do
    User.create(name: 'Katie', username: 'KS', email: 'K@email.com', password: 'secret', password_confirmation: 'secret')
  end

  let(:text) { "Hi, I am using Chitter!" }

  scenario 'a user can have associated peeps' do
    sign_up(user)
    log_in(user.username, user.password)
    peep(text)
    expect(user.peeps.map(&:content)).to include('Hi, I am using Chitter!')
  end

  scenario 'a logged in user can post a new message' do
    sign_up(user)
    log_in(user.username, user.password)
    peep(text)
    expect(page).to have_content('Hi, I am using Chitter!')
  end

  scenario 'the name and username or the user is displayed with their peep' do
    sign_up(user)
    log_in(user.username, user.password)
    peep(text)
    expect(page).to have_content('Katie, KS')
  end
end
