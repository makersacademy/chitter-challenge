require 'web_helpers'

feature 'Creating peeps' do

  scenario "a not logged in user can't see the new peep form" do
    visit('/')
    expect(page).not_to have_button('Peep')
  end

  feature 'with authentication' do
    before { sign_up(username: 'tester', email: 'test@test.com') }

    scenario 'user creates a peep' do
      fill_in :peep_text, with: 'Hello world'
      click_button 'Peep'
  
      expect(page).to have_content('Hello world')
      expect(page).to have_content('@tester')
    end
  
    scenario 'creating a peep that is too long (280+ chars)' do
      str = "!" * 281
      fill_in :peep_text, with: str
      click_button 'Peep'
  
      expect(page).to have_content("That peep is too long!")
    end
  end
end

feature 'Replying to peeps' do
  before do
    sign_up(username: 'tester', email: 'test@test.com')
    fill_in :peep_text, with: "What's 2 + 2?"
    click_button 'Peep'
  end

  scenario "user tries to reply to their own peep" do
    visit('/')
    
    find(:xpath, "/html/body/div[2]/div[1]/a[1]").click # clicks the peep

    expect(page).not_to have_button 'Peep'
  end
  
  feature 'Replying to peeps as other users' do
    before do
      click_button 'Log out'
    end

    scenario "user tries to reply when logged out" do
      visit('/')
      
      find(:xpath, "/html/body/div[2]/div[1]/a[1]").click

      expect(page).not_to have_button 'Peep'
    end

    scenario "user replies to another user's tweet" do
      sign_up(username: 'replyer', email: 'replyer@test.com')
      visit('/')

      find(:xpath, "/html/body/div[2]/div[1]/a[1]").click

      fill_in :peep_text, with: "I think it's 4"
      click_button 'Peep'

      expect(page).to have_content("I think it's 4")
    end
  end
end
