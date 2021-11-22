require_relative 'web_helpers'

feature 'posting a peep' do

  scenario '"new peep" button brings up a form' do
    visit_home_and_select_new_peep

    within('form') { 
      expect(page).to have_content 'Your Name:'
      expect(page).to have_content 'Your Username:'
      expect(page).to have_content 'Your Peep:'

      expect(page).to have_button 'Post Peep'
    }

  end

  scenario 'my peep shows up under recent peeps when i hit "post peep" button' do
    visit_home_and_select_new_peep

    fill_in 'name', with: 'jon'
    fill_in 'username', with: 'jj123'
    fill_in 'peep', with: 'This is my first peep!'
    click_button 'Post Peep'

    expect(page).to have_content 'Name: jon, Username: jj123'
    expect(page).to have_content 'This is my first peep!'
  end

end
