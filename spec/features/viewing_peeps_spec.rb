feature 'viewing peeps in reverse chronological order' do
  scenario 'User is able to see a feed page of peeps' do
    visit('/chitter_feed')
    expect(page).to have_content('I ran 8 miles today, #winning')
  end
end