feature 'post message to chitter' do
  xscenario 'post anonymous message to Chitter' do
    visit '/'
    fill_in 'Name', with: 'Igor'
    fill_in 'Message', with: 'This is a test peep'
    click_on 'PEEP!'
    expect(page).to have_content 'This is s test peep'
  end
end