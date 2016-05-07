feature 'User can create a new peep' do
  scenario 'User creates a peep with timestamp' do
    peep_once
    d = Time.new
    day = d.strftime("%A")
    time = d.strftime("%I:%M%p")
    within 'ul#peeps' do
      expect(page).to have_content 'first peep'
      expect(page).to have_content 'Peeped by: alias'
      expect(page).to have_content day
      expect(page).to have_content time
    end
  end
  scenario 'User sees a list of peeps in reversed cronological order' do
    peep_once
    click_button 'Peep!'
    fill_in :body, with: 'second peep!'
    click_button 'Peep it!'
    within 'ul#peeps' do
      expect(page.body.index('second peep')).to be < page.body.index('first peep')
    end
  end
end
