feature 'Viewing peeps' do
  scenario 'User sees peeps in reverse chronological order' do
    visit('/')

    expect(page).to have_content '2019-03-03; 08:52; The peep at the top of the page is the most recent'
    expect(page).to have_content '2019-03-02; 10:45; Homepage shows peeps in reverse chronological order'
    expect(page).to have_content '2019-03-02; 10:34; On Chitter, we post messages called "Peeps"'
  end
end