feature 'viewing peeps' do
  scenario 'user visits peeps page and sees a list of peeps' do

    Peep.create(message: 'Wow it was hot yesterday...')
    Peep.create(message: 'Busy doing some coding today')
    Peep.create(message: 'Heading to the pub later!')

    visit '/peeps'

    expect(page).to have_content 'Wow it was hot yesterday...'
    expect(page).to have_content 'Busy doing some coding today'
    expect(page).to have_content 'Heading to the pub later!'
  end
end
