feature 'User can create a new peep' do
  scenario 'User creates a peep' do
    sign_up
    click_button 'Peep!'
    fill_in :body, with: 'My first peep!'
    click_button 'Peep it!'
    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'Peeped by: alias'
  end
  scenario 'User sees a list of peeps in reversed cronological order' do
    sign_up
    click_button 'Peep!'
    fill_in :body, with: 'first!'
    click_button 'Peep it!'
    click_button 'Peep!'
    fill_in :body, with: 'second!'
    click_button 'Peep it!'
    within 'ul#peeps' do
      expect(page.body.index('second!')).to be < page.body.index('first!')
    end
  end
  scenario 'User sees timestamps in peeps' do
    sign_up
    click_button 'Peep!'
    fill_in :body, with: 'My first peep!'
    click_button 'Peep it!'
    d = Time.new
    day = d.strftime("%A")
    time = d.strftime("%I:%M%p")
    within 'ul#peeps' do
      expect(page).to have_content day
      expect(page).to have_content time
    end
  end
end
