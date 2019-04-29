feature 'Viewing peeps' do
  scenario 'A user can view a list of peeps' do
    visit('/')
    expect(page).to have_content "My first peep!"
    expect(page).to have_content "Wow, this is my second peep!"
    expect(page).to have_content "THIS IS MY THIRD PEEP, I can't believe it!!!"
  end
end
