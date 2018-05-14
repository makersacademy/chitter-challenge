feature 'post message to chitter' do
  scenario 'post anonymous message to Chitter' do
    visit '/'
    fill_in 'Name', with: 'Igor'
    fill_in 'Message', with: 'This is a test peep'
    click_on 'PEEP!'
    page.has_content? 'This is s test peep'
  end
end