feature 'user can see list of peeps' do
  scenario 'user visits home page' do
    visit '/'
    expect(page).to have_content('my first peep')
  end
end
