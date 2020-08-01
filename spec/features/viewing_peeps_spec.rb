feature 'viewing peeps' do
  scenario 'user visits peeps page and sees a list of peeps' do
    visit '/peeps'
    expect(page).to have_content 'Busy doing some coding today'
  end
end
