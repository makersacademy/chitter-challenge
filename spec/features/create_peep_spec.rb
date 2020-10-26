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
  
      expect(page).to have_content 'This is my third peep!'
      expect(page).to have_content 'This is my second peep!'
      expect(page).to have_content 'This is my first peep!'
    end
  end
  
  # feature 'User can see the time a and date a peep was made' do
  #   scenario 'adds new peep and can see time' do
  #     visit('/')
  #     fill_in('peep', with: 'A peep is now timed')
  #     click_button('PEEP')
  #     time = Time.now.strftime('%Y-%m-%d %k:%M:%S')
  #     expect(page).to have_content("A peep is now timed - #{time}")
  #   end
  # end
  





end