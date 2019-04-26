feature 'Viewing peeps' do
  scenario 'A user can view a list of peeps' do
    visit('/')
    expect(page).to have_content "My first peep!"
  end
end
