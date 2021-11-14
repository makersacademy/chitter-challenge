feature 'posting a peep' do

  scenario '"new peep" button brings up a form' do
    visit '/'
    click_on 'New Peep'

    within('form') { 
      expect(page).to have_content 'Enter your peep'
      expect(page).to have_content 'Post Peep'
    }

  end

  scenario 'my peep shows up on homepage when i hit "post peep" button' do
    visit '/'
    click_on 'New Peep'
    fill_in'Your Peep', with:'This is my first peep!'
    click_button 'Post Peep'
    expect(page).to have_content 'This is my first peep!'
  end


  # scenario 'peep includes user handle' do
    
  # end
  # scenario 'peep includes users name' do
    
  # end
  # scenario 'peep includes text' do
    
  # end

end