feature 'Homepage' do
  scenario 'Displays the peep channel' do
    visit('/homepage')
    expect(page).to have_content 'My first peep!'
    expect(page).to have_content '@ddregalo'
    expect(page).to have_content 'Daniel Campos'
    expect(page).to have_content '2018-03-17 13:40:22'
    expect(page).to have_content 'The world is flat.'
    expect(page).to have_content '@bhavy'
    expect(page).to have_content 'Bhav P'
    expect(page).to have_content '2018-03-17 13:45:44'
  end
end
