feature 'Users have their own peeps stored in database' do
  scenario 'a users peep is stored' do
    user = (create :user, username: 'owner', email: 'a@a.com')
    sign_in(user)
    visit '/peeps'
    fill_in 'new_peep', with: 'posted this'
    click_on 'Peep'
    expect(User.get(user.id).peeps.map(&:content).sample).to eq('posted this')
  end
end
