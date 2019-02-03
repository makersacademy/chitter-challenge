require_relative '../web_helper.rb'
require 'timecop'

feature 'Viewing peeps' do 
  include Helpers
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
  scenario 'viewing peeps' do
    enter_chitter
    expect(page).to have_content "HELLO"
    expect(page).to have_content "This is my second peep"
  end
end

feature 'Adding new peeps' do
  include Helpers
  before(:each) do
    go_to_add_peep_page
  end
  scenario 'A user can add a new peep to Chitter' do
    fill_in "new_peep", :with => 'Third peep'
    click_button 'add'
    expect(page).to have_content 'Third peep'
  end

  scenario 'Peeps should be in reverse chronological order' do
    fill_in "new_peep", :with => 'Third peep'
    click_button 'add'
    within(first('.peep')) do
      expect(page).to have_content 'Third peep'
    end
  end    

  scenario 'Can see the time at which the peep was posted' do
    Timecop.freeze do
      fill_in "new_peep", :with => 'Third peep'
      click_button 'add'
      within(first('.peep')) do
        expect(page).to have_content "on #{DateTime.now.strftime('%d/%m/%Y')} at #{DateTime.now.strftime('%I:%M%p')}"
      end
    end
  end

  scenario 'Can see the user who posted the peep' do
    fill_in "new_peep", with: 'Third peep'
    click_button 'add'
    within(first('.peep')) do
      expect(page).to have_content 'peeped by ES94'
    end
  end 
end
