feature 'viewing peeps' do
  scenario 'user visits peeps page and sees a list of peeps' do
    visit '/peeps'
    sign_up
    Peep.create(message: 'Wow it was hot yesterday...', user_id: 1)
    Peep.create(message: 'Busy doing some coding today', user_id: 1)
    Peep.create(message: 'Heading to the pub later!', user_id: 1)

    visit '/peeps'

    expect(page).to have_content 'Wow it was hot yesterday...'
    expect(page).to have_content 'Busy doing some coding today'
    expect(page).to have_content 'Heading to the pub later!'
  end
end
