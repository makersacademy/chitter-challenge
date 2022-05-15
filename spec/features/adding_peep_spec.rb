feature "Adding a new peep" do
  scenario 'A user can add a new peep to Chitter' do
    sign_up
    log_in

    Timecop.freeze(Time.parse("2022-05-13 16:40:52")) do
      visit('/peep')
      fill_in('peep_text', with: 'Every application somehow needs PosgreSQL')
      click_button 'Submit'
  
      visit('/peep')
  
      expect(page).to have_content 'Every application somehow needs PosgreSQL'
      expect(page).to have_content "2022-05-13 16:40:52"
    end
    
  end
end
