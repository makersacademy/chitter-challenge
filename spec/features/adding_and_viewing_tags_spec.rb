feature 'Adding and viewing tags' do
  feature 'a user can add and then view a tag' do
    scenario 'a tag is added to a peep' do
      user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
      visit 'sessions/new'
      fill_in('email', with: 'test@example.com')
      fill_in('password', with: 'password123')
      click_button('LOGIN')
      expect(current_path).to eq "/peeps"
      fill_in('peep', with: 'hi')
      click_button('Submit')
      expect(current_path).to eq "/peeps"
      # peep = Peep.create(peep: "Hi there!", user_id: user.id)

      first('.peep').click_button 'Add Tag'

      expect(current_path).to eq "/peeps/#{peep.id}/tags/new"

      fill_in 'tag', with: 'test tag'
      click_button 'Submit'

      expect(current_path).to eq '/peeps'
      expect(first('.peep')).to have_content 'test tag'
    end
  end
end