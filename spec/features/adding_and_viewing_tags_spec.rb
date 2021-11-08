feature 'Adding and viewing tags' do
  feature 'a user can add and then view a tag' do
    scenario 'a tag is added to a peep' do
      user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
      peep = Peep.create(peep: "Hi there!", user_id: user.id)

      visit '/peeps'
      first('.peep').click_button 'Add Tag'

      expect(current_path).to eq "/peeps/#{peep.id}/tags/new"

      fill_in 'tag', with: 'test tag'
      click_button 'Submit'

      expect(current_path).to eq '/peeps'
      expect(first('.peep')).to have_content 'test tag'
    end
  end
end