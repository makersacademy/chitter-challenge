require 'spec_helper'

feature 'View peeps' do
  before do
    user = User.create( username: 'User',
                        email: 'user@nomail.com',
                        name: 'Firstname Lastname',
                        password: 's3cr3t',
                        password_confirmation: 's3cr3t')
    Peep.create(user: user, content: 'My first peep!')
    visit '/'
  end

  context 'when not logged in' do
    # TODO: test reverse chronological order
    scenario 'user sees a list of peeps in reverse chronological order' do
      within('section#peeps') do
        expect(page).to have_content(Peep.first.content)
      end
    end

    scenario 'user sees the name and username handle of the peep\'s author' do
      within('section#peeps') do
        expect(page).to have_content(Peep.first.user.name)
      end
    end

    scenario 'user sees a timestamp for each peep' do
      within('section#peeps') do
        expect(page).to have_content(Peep.first.created_at
        .strftime('%a, %d %b %Y at %l:%M %p'))
      end
    end
  end
end
