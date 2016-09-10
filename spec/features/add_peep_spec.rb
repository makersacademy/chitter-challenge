require 'spec_helper'

feature 'Add peep' do

  before(:each) do
    sign_up('abigail',
            'abi@test.com',
            'abimcp',
            'password123',
            'password123')
    Capybara.reset_sessions!
  end

  scenario 'a logged in user can write and post a peep' do
    log_in('abi@test.com', 'password123')
    click_button('New peep')
    fill_in('content', with: 'testing')
    click_button('Peep!')
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'testing'
    end
  end
  #
  # scenario 'a user cannot peep unless they are logged in' do
  #   visit '/peeps/new'
  #   expect(page).to have_content 'You must be logged in to peep!'
  #   click_button('Back to homepage')
  #   expect(current_path).to eq '/peeps'
  # end

end
