feature 'posting a peep' do
  scenario 'user can write a peep and post it' do
    sign_up
    add_peep('Is anybody out there?')
    expect(page).to have_content 'Is anybody out there?'
    expect(page).to have_content 'by Alex'
  end
end
