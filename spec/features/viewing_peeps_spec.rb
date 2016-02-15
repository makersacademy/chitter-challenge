feature 'Viewing peeps' do
  let(:user) { user = create(:user) }

  scenario 'People can view peeps' do
    peep = create(:peep, user: user)
    visit '/peeps'
    expect(page).to have_content peep.message
    expect(page).to have_content "@#{peep.user.username}"
  end
end
