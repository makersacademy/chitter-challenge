require_relative 'web_helpers'

feature 'Viewing Peeps' do
  scenario 'all peeps are shown in reverse chronological order' do
    Peep.create(message: 'peep1')
    Peep.create(message: 'peep2')
    sign_in
    expect(page.all('li')[0].text).to include "peep2"
    expect(page.all('li')[1].text).to include "peep1"
  end

end
