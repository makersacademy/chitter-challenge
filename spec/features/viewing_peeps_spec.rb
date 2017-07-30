feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    create_peep
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content("Barney: Hello world")
    end
  end

  scenario 'I want to see Peeps in reversed chronological order' do
    create_peep(name: 'Barney')
    create_peep(name: 'Maria')
    visit '/peeps'
    expect(Peep.last.name).to include 'Maria'
  end

  scenario 'existing Peeps have timestamp next to them' do
    create_peep
    visit '/peeps'
    expect(page).to have_content 'Sun' || 'Mon' || 'Tue' || 'Wed' || 'Thur' || 'Fri' || 'Sat'
  end

end
