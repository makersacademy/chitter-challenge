# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Create peeps' do
  let(:user) do
    User.create(name: 'Iryna',
                username: 'irisha',
                email: 'iryna@mail.com',
                password: 'chitter!',
                password_confirmation: 'chitter!')
  end

  scenario 'I can post a peep' do
    visit '/'
    log_in(user.email, user.password)
    fill_in 'peep',   with: 'Another chitter message!'
    click_button 'Add message'
    expect(current_path).to eq '/'
    expect(page).to have_content('Another chitter message!')
  end
end


# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'See all peeps' do
  let(:user) do
    User.create(name: 'Iryna',
                username: 'irisha',
                email: 'iryna@mail.com',
                password: 'chitter!',
                password_confirmation: 'chitter!')
  end

  scenario 'in reverse chronological order' do
    message = 'First message to Chitter!'
    Peep.create(message: message,
                posted_at: '02/14/2016 at 08:03:04PM',
                user_id: user.id)
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content(message)
  end
end

# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'See all peeps' do
  let(:user) do
    User.create(name: 'Iryna',
                username: 'irisha',
                email: 'iryna@mail.com',
                password: 'chitter!',
                password_confirmation: 'chitter!')
  end

  scenario 'with time they were made' do
    message = 'First message to Chitter!'
    Peep.create(message: message,
                posted_at: '02/14/2016 at 08:03:04PM',
                user_id: user.id)
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('02/14/2016 at 08:03:04PM')
  end
end
