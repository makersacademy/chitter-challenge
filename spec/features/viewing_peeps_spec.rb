feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')
    expect(page).to have_content "It's my first peep!"
  end
end
