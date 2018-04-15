feature 'Viewing peeps' do
  scenario 'Can see peeps on main page' do
    Peep.add(content: 'test peep')
    visit('/')
    expect(page).to have_content "test peep"
  end
end
