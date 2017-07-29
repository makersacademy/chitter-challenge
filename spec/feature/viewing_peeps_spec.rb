require_relative 'web_helper'
feature 'Viewing peeps' do

  scenario 'I want to see all the peeps' do
    Peep.create(peep: "Peep 1", time: "year ago")
    Peep.create(peep: "Peep 2", time: "yesterday")
    Peep.create(peep: "Peep 3", time: "today")
    visit '/messages'
    expect(page.status_code).to eq 200
  
    within 'ul#peeps' do
      expect(page).to have_content "Peep 1"
      expect(page).to have_content "Peep 2"
      expect(page).to have_content "Peep 3"
    end
  end
end
