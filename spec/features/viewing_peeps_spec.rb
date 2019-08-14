feature 'viewing peeps' do
  scenario 'viewing peeps on homepage' do
    visit ('/')
    expect(page).to have_content "This is the first peep"
  end
end
