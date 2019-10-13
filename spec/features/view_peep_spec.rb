require 'timecop'

feature 'see all peeps' do
  scenario 'I can see all peeps' do
    visit '/'
    fill_in :text, with: 'This is my First peep'
    click_button 'Add peep'
    click_button 'View all Peeps'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is my First peep'
  end

  scenario 'Peeps are displayed in reverse chronological order' do
    Timecop.freeze(2019, 10, 13, 16, 0, 0)
    visit '/'
    fill_in :text, with: 'This is my First peep'
    click_button 'Add peep'
    expect(current_path).to eq '/'
    Timecop.freeze(2019, 10, 13, 17, 0, 0)
    fill_in :text, with: 'This is my second peep'
    click_button 'Add peep'
    click_button 'View all Peeps'
    expect(page).to have_content "posted on October 13th at 05:00PM\nThis is my second peep\nposted on October 13th at 04:00PM\nThis is my First peep"
  end
end
