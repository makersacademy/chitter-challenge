require 'timecop'

feature 'Time' do
  scenario 'User sees the time of a peep after posting it' do
    time = Timecop.freeze
    visit('/peeps')
    click_button('Post a Peep')
    fill_in('peep', with: 'Peep')
    click_button('Submit Peep')
    expect(page).to have_content("#{time.strftime("%k:%M")}")
    expect(page).to have_content("#{time.strftime("%d/%m")}")
  end
end
