RSpec.feature 'peep with time' do
  scenario 'the peep include the time' do
    visit '/chitter'
    fill_in 'peep', with: 'First peep!'
    click_button 'submit'

    expect(page).to have_content(Time.now.strftime("%Y-%m-%d %H:%M"))
  end
end