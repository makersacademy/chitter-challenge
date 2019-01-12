require './lib/message'
require 'capybara/rspec'

feature '1. Post Peep to Chitter' do
  scenario 'Post new message and display it beneath' do
    visit '/'
    fill_in('content', :with => 'Peep peep')
    click_button('Send')
    expect(page).to have_content('Peep peep')
  end
end

feature '2. View all Peeps' do
  scenario 'Shows all peeps in reverse chronological order' do
    visit '/'
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

feature '3. Timestamp' do
  scenario 'See the time at which peep was made' do
    visit '/'
    fill_in('content', :with => 'Peep peep')
    click_button('Send')
    expect(page).to have_content('Peep peep')
  end
end
