feature 'posting peeps' do

  before do
    Timecop.freeze(Time.local(1990))
  end

  scenario 'user can post a peep' do
    visit '/peeps/new'
    fill_in :content, with: 'Peeping, peeping, 123'
    click_button 'Peep this'
    visit '/peeps'
    expect(page).to have_content 'Peeping, peeping, 123'
  end

  scenario 'peep features the date and time' do
    visit '/peeps/new'
    fill_in :content, with: 'Peeping, peeping, 123'
    click_button 'Peep this'
    visit '/peeps'
    expect(page).to have_content Time.now.strftime("%c")
  end
end
