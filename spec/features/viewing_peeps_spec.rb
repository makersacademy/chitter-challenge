feature 'Viewing peeps' do
  # as a social media user
  # so i can see the chitter feed
  # i want to be able to view the chitter peeps
  scenario 'A user can see the peeps' do
    visit('/peeps')

    expect(page).to have_content("the sky is blue")
    expect(page).to have_content("the sea is green")
    expect(page).to have_content("fire is red")
  end
end
