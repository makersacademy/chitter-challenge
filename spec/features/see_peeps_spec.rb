feature 'Viewing peeps' do
  scenario 'A user can see all peeps' do
    visit ('/')

    expect(page).to have_content "Hello world"
  end
end
