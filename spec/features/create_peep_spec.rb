feature 'User can make add a peep' do
  scenario 'visits webpage and makes peep' do
    visit('/')
    fill_in('peep', with: 'This is my first peep!')
    click_button('PEEP')

    expect(page).to have_content 'This is my first peep!'
  end

  feature 'peeps are shown in reverse chronological order' do
    scenario 'visits webpage, adds multiple peeps' do
      visit('/')
      fill_in('peep', with: 'This is my first peep!')
      click_button('PEEP')
      fill_in('peep', with: 'This is my second peep!')
      click_button('PEEP')
      fill_in('peep', with: 'This is my third peep!')
      click_button('PEEP')
  
      expect(page).to have_content('This is my third peep! This is my second peep! This is my first peep!')
    end
  end
  





end