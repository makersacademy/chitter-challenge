require_relative 'web_helper'
require './app/helper'

feature 'Peeps creation' do
  scenario 'Users are able to post a peep (message)' do
    create_peep

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Setting up Chitter. This is my first peep.')
    end
  end

  scenario 'Peeps are created with a timestamp' do
    create_peep

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Posted ')
    end
  end
end
