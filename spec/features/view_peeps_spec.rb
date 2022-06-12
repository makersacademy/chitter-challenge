feature 'Viewing peeps' do
  scenario 'A user can see the peeps' do
    visit('/')

    expect(page).to have_content "First Peep"
  end
end