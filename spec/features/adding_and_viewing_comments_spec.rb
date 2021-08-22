feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a bookmark' do
      Peep.create("this is a test peep")
      visit('/')
      first('.peep').click_button 'Add comment'
      expect(current_path).to eq "/peeps/#{peep.id}/comments/new"

      fill_in 'comment', with: 'This is a test comment on this bookmark'

      expect(current_path).to eq '/'
      expect(first('.peep')).to have_content 'This is a test comment on this bookmark'
    end
  end
end