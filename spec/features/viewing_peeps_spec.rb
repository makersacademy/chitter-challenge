require 'spec_helper'
require_relative '../../app/data_mapper_setup'
# require 'app/data_mapper_setup'

feature 'Viewing peeps' do

  scenario 'User does not have to be signed in' do
    user = create(:user)
    peep = Peep.new(content: "First peep",
                username: user.username,
                name: user.name,
                time: Time.now)
    peep.user = user
    peep.save
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('First peep')
    end
  end

  scenario 'peep displays name of user' do
    user = create(:user)
    peep = Peep.new(content: "First peep",
                username: user.username,
                name: user.name,
                time: Time.now)
    peep.user = user
    peep.save
    visit '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Alice Wonderland')
      expect(page).to have_content('alice123')
    end
  end

end
