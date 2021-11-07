feature 'Adding and viewing tags' do
  feature 'a user can add and then view a tag' do
    scenario 'a comment is added to a peep' do
      peep = Peep.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

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