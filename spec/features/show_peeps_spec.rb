feature 'show peeps' do
  scenario 'on /peeps' do
    visit('/peeps')
    expect(page).to have_content('My first peep yoooo')
    expect(page).to have_content('Just got this peep app! unbelievable!')
    expect(page).to have_content('Peep is kicking off!')
  end
end
