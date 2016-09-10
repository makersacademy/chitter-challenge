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
    add_peep
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'testing'
    end
  end

  scenario 'a user cannot peep unless they are logged in' do
    visit '/'
    click_button('New peep')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'log in to peep!'
  end

end
