feature 'viewing peeps' do
  scenario 'user visits peeps page and sees a list of peeps' do
    visit '/peeps'
    sign_up
    fill_in('message', with: 'Wow it was hot yesterday...')
    fill_in('message', with: 'Busy doing some coding today')
    fill_in('message', with: 'Heading to the pub later!')
    click_button('Peep')

    visit '/peeps'

    expect(page).to have_content 'Wow it was hot yesterday...'
    expect(page).to have_content 'Busy doing some coding today'
    expect(page).to have_content 'Heading to the pub later!'
  end
end
