feature 'Viewing peeps:' do
  scenario 'I can see a list of peeps on the home page' do
    Peep.create(message: 'Little Bo Peep has lost her sheep')
    visit '/'
    within 'div#peeps' do
      expect(page).to have_content('Little Bo Peep has lost her sheep')
    end
  end
  scenario 'I get a no peeps message when there are none' do
    visit '/'
    within 'div#peeps' do
      expect(page).to have_content('not a peep to be heard')
    end
  end
  scenario 'The peeps are displayed with their timestamps' do
    peep = Peep.create(message: 'Little Bo Peep has lost her sheep')
    visit '/'
    within 'div#peeps' do
      expect(page).to have_content(peep.created_at)
    end
  end
  scenario 'The peeps are displayed in reverse chronological order' do
    peep1 = Peep.create(message: 'Little Bo Peep has lost her sheep')
    peep2 = Peep.new(message: 'And doesn\'t know where to find them.')
    peep2.created_at = (peep1.created_at.to_time + 60).to_datetime
    peep2.save
    visit '/'
    within 'div#peeps' do
      expect(page.body.index('Little')).to be > page.body.index('And')
    end
  end
end
