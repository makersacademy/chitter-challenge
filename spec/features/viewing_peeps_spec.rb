feature 'Viewing peeps:' do

  include Helpers

  scenario 'I can see a list of peeps on the home page' do
    peep = build :peep
    peep.save
    visit '/'
    within 'div#peeps' do
      expect(page).to have_content(peep.message)
    end
  end

  scenario 'I get a no peeps message when there are none' do
    visit '/'
    within 'div#peeps' do
      expect(page).to have_content('not a peep to be heard')
    end
  end

  scenario 'The peeps are displayed with their timestamps' do
    peep = build :peep
    peep.save
    visit '/'
    within 'div#peeps' do
      expect(page).to have_content(prettify(peep.created_at))
    end
  end

  scenario 'The peeps are displayed in reverse chronological order' do
    peep1 = build :peep, message: 'early bird'
    peep1.save
    peep2 = build :peep, message: 'late worm'
    peep2.created_at = (peep1.created_at.to_time + 60).to_datetime
    peep2.save
    visit '/'
    within 'div#peeps' do
      expect(page.body.index('early bird')).to be > page.body.index('late worm')
    end
  end

end
