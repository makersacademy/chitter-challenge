feature 'Viewing peeps' do
  scenario 'A user can see peep meassages' do
    visit('/peeps')

    expect(page).to have_content "This is message 3"
    expect(page).to have_content "Here is message 2"
    expect(page).to have_content "hello message 1"
  end
end
