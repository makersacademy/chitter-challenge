feature 'Viewing peeps' do
  scenario 'A user can see their peeps' do
    visit '/'
    expect(page).to have_content "Hello World!"
  end
end
