require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/')
    expect(page).to have_content "The night I lost CTRL"
    expect(page).to have_content "Byte me!"
    expect(page).to have_content "SQL Clause is coming to town!"
end

scenario 'Valid peep string added and shown' do
  visit('/')
  fill_in 'string', with: 'The night I lost CTRL'
  click_button 'Peep it'
  expect(page).to have_content 'The night I lost CTRL'
end

end
