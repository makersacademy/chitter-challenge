feature 'All peeps' do

  scenario 'Homepage should contain a list of all peeps' do
    multi_peep

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content 'My first peep'
      expect(page).to have_content 'Hello World'
    end
  end
end
