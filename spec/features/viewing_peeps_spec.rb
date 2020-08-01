feature 'viewing peeps' do
  scenario 'user visits peeps page and sees a list of peeps' do
    visit '/peeps'
    expect(page).to have_content 'Another great win for Liverpool!'
    expect(page).to have_content 'Wow, its a scorcher today'
    expect(page).to have_content 'Looking forward to be able to go to gigs again'
  end
end
