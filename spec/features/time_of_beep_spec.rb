require 'database_wiper'
feature 'Add a beep' do
  before(:each) do
    database_wiper
  end
  scenario 'user can post a beep and see it in the pixelstream' do
    visit('/')
    fill_in 'beep', with: 'Here is the REAL body of my beeep'
    click_on('beep-boop')
    expect(page).to have_content(Time.now().to_s[11..19])
    expect(page).to_not have_content('error')
  end
end
