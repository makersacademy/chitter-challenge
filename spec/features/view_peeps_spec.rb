feature 'viewing a peep' do
  scenario 'peeps should be assigned to a user' do
    sign_up
    fill_in 'peep', with: 'This is Ed\'s peep'
    click_button 'Peep!'
    within 'ul#peeps' do
      expect(page).to have_content 'Edward peeped: This is Ed\'s peep'
    end
  end

  scenario 'peeps should appear in reverse order do' do
    sign_up
    fill_in 'peep', with: 'Peep 1'
    click_button 'Peep!'
    click_link "Compose a peep!"
    fill_in 'peep', with: 'Peep 2'
    click_button 'Peep!'
    within 'ul#peeps' do
      expect(page).to have_content 'Edward peeped: Peep 2 Edward peeped: Peep 1'
    end
  end
end
