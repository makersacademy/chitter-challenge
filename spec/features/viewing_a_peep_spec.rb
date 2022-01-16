require 'timecop'

feature 'Viewing peeps' do
  before do
    Timecop.freeze(Time.local(2022, 1, 9, 10, 5, 0))
  end

  after do
    Timecop.return
  end
  
  scenario 'A user can see when a peep was posted' do
    visit('/chitter')

    fill_in('peep', with: 'Test peep')
    click_on 'Peep!'
  
    expect(page).to have_content "Peeped at 10:05 AM on 01/09/2022"
  end
end
