require './lib/message'
require './lib/user'
require 'capybara/rspec'
require './spec/web_helper'

RSpec.feature 'Posting Peeps:-' do
  feature 'Feature 2. Post Peep to Chitter' do
    scenario 'Post new message and display it beneath' do
      signup_steps
      signin_steps
      fill_in('content', :with => 'Peep peep')
      click_button('Send')
      expect(page).to have_content('Peep peep')
    end
  end

  feature 'Feature 3. View all Peeps' do
    scenario 'Shows all peeps in reverse chronological order' do
      signin_steps
      fill_in('content', :with => 'Peep1')
      click_button('Send')
      fill_in('content', :with => 'Peep2')
      click_button('Send')
      fill_in('content', :with => 'Peep3')
      click_button('Send')
      expect(page).to have_content('Peep1')
      expect(page).to have_content('Peep2')
      expect(page).to have_content('Peep3')
    end
  end

  feature 'Feature 4. Timestamp' do
    scenario 'See the time at which peep was made' do
      signin_steps
      fill_in('content', :with => 'Peep peep')
      click_button('Send')
      expect(page).to have_content('Peep peep')
    end
  end
end
