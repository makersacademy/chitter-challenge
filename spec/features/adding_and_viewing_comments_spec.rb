feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a peep' do
      bookmark = Peep.create(peep: 'Salut!')

      visit '/peeps'
      first('.peep').click_button 'Add Comment'

      expect(current_path).to eq "/peeps/#{bookmark.id}/comments/new"

      fill_in 'comment', with: 'This is a test comment on this bookmark'
      click_button 'Submit'

      expect(current_path).to eq '/peeps'
      expect(first('.peep')).to have_content 'This is a test comment on this bookmark'
    end
  end
end