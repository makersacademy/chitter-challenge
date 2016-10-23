require 'spec_helper'

feature 'Making Peeps' do
  before do
    sign_up
    peep('Hello, World')
  end

  scenario 'peeps shows peepers name, username, message and time' do
    peep_time = Peep.first.created_at
    expect(page).to have_content("(Chit Ter) @sir_chitter: Hello, World(#{peep_time})")
  end
  scenario 'peeps are shown in reverse chronological order' do
    peep('Another peep')
    expect('Hello, World').to appear_before('Another peep')
  end
  scenario 'peeps can be seen if not logged in' do
    sign_out
    visit '/home'
    peep_time = Peep.first.created_at
    expect(page).to have_content("(Chit Ter) @sir_chitter: Hello, World(#{peep_time})")
  end
end
