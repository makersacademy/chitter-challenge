feature 'Viewing peeps' do
  scenario 'I can see existing peeps' do
    user = create(:user)
    write_peep(user, 'Hi there!')
    write_peep(user, 'How is everyone?')
    visit '/peeps'
    expect(page).to have_content('Hi there!')
    expect(page).to have_content('How is everyone?')
  end
end