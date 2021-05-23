feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a chirp' do
      chirp = Chitt.create(chirp: 'tweet')

      visit '/chitter'
      first('.chirp').click_button 'Add Comment'

      expect(current_path).to eq "/chitter/#{chirp.id}/comments/new"

      fill_in('comment', with: 'This is a test comment on this chirp')
      click_button('Add Comment')

      expect(current_path).to eq('/chitter')
      expect(first('.chirp')).to have_content('This is a test comment on this chirp')
    end
  end
end