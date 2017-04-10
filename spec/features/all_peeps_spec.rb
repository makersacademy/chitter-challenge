feature 'All peeps' do

  let(:peep) { Peep.first }

  scenario 'Homepage should contain a list of all peeps' do
    multi_peep

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content 'My first peep'
      expect(page).to have_content 'Hello World'
    end
  end

  scenario 'Peeps should display time' do
    Timecop.freeze do
      single_peep

      visit '/peeps'
      expect(page.status_code).to eq 200

      within 'ul#peeps' do
        expect(page).to have_content peep.format_time(peep.created_at)
      end
    end
  end

  scenario 'Should be in reverse chronological order' do
    multi_peep
    expect(page.find("li:nth-child(1)")).to have_content "My first peep"
    expect(page.find("li:nth-child(2)")).to have_content "Hello World"
  end
end
