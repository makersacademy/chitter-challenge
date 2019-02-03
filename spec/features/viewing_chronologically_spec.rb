feature 'Viewing Peeps Chronologically:' do
  scenario '- should show them in descending DATE/TIME order' do
    visit ('/chitter')
    fill_in 'message', with: 'This is test peep 1'
    fill_in 'name', with: 'Jane'
    click_button 'Peep!'
    fill_in 'message', with: 'This is test peep 2'
    fill_in 'name', with: 'John'
    click_button 'Peep!'
    expect('This is test peep 2').to appear_before('This is test peep 1')
  end
end
