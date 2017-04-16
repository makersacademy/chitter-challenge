require 'helpers'
require 'timecop'

feature 'Peeps' do
  before do
    create_user
    sign_in(email: 'noora@example.com', password: 'password')#redirects to index with sign in button which redirects to sessions/new
  end

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter
  scenario 'I can post peeps' do
    create_peep('This is my first peep!')
    expect(page).to have_content('This is my first peep!')
  end

  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario 'Peeps are shown in reverse chronological order' do
    create_peep('This is my first peep!')
    Timecop.travel(DateTime.now + 1) do
      create_peep('This is my second peep!')
    end
    expect(page.all('.peep .content').map(&:text)).to eq(['This is my second peep!', 'This is my first peep!'])
  end

  # As a maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario 'I can see the timestamp for a peep' do
    Timecop.freeze do
      create_peep('This is my first peep!')

      within('.peep .timestamp') do
        expect(page).to have_content(DateTime.now.strftime("%c"))
      end
    end
  end
end
