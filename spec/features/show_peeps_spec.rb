require 'pg'

feature 'show peeps' do
  scenario 'on /peeps' do
    visit('/peeps')
    new_peep('My first peep yoooo')
    new_peep('Just got this peep app! unbelievable!')
    new_peep('Peep is kicking off!')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_text('My first peep yoooo')
    expect(page).to have_text('Just got this peep app! unbelievable!')
    expect(page).to have_text('Peep is kicking off!')
  end
end
