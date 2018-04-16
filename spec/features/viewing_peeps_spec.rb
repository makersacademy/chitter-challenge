feature 'Viewing peeps' do
  scenario 'Can see peeps on main page' do
    user = double(:user, id: 0, name: 'Patrick')
    Peep.add({:content => 'test peep'}, user)
    visit('/')
    expect(page).to have_content "test peep"
  end
end
