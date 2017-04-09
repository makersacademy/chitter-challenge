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
      # expect(peep.created_at).to eq Time.now

      visit '/peeps'
      expect(page.status_code).to eq 200

      within 'ul#peeps' do
        expect(page).to have_content peep.format_time(peep.created_at)
      end
    end
  end
end
