require 'timecop'
feature 'viewing peeps' do
  scenario 'creating new peep' do
    sign_up
    Timecop.freeze do
      visit '/peeps/new'
      fill_in :content, with: 'This is my first peep'
      click_button 'Peep'
      expect(page).to have_content DateTime.now.strftime('%c')
    end
  end

  scenario 'peeps are displayed in reverse order' do
    sign_up
    visit '/peeps/new'
    fill_in :content, with: 'This is my first peep'
    click_button 'Peep'
    Timecop.travel(DateTime.now + 1) do
      visit '/peeps/new'
      fill_in :content, with: 'This is my second peep'
      click_button 'Peep'
    end
    expect(page.all('.peep .content').map(&:text)).to eq(['This is my second peep', 'This is my first peep'])
  end
end
