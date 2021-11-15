require_relative 'web_helpers'

feature 'posting a peep' do

  scenario '"new peep" button brings up a form' do
    visit_home_and_select_new_peep

    within('form') { 
      expect(page).to have_content 'Your Peep:'
      expect(page).to have_content 'Post Peep'
    }

  end

  scenario 'my peep shows up on recent peeps page when i hit "post peep" button' do
    visit_home_and_select_new_peep

    fill_in 'peep', with: 'This is my first peep!'
    click_button 'Post Peep'
    expect(page).to have_content 'This is my first peep!'
  end

  # scenario 'peep includes user handle' do
    
  # end

  # scenario 'peep includes users name' do
    
  # end


end
