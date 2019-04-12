feature 'Adding and viewing tags' do
  feature 'a user can add and then view a tag' do
    scenario 'a tag is added to a peep' do

      user = User.create(email: 'newtest@example.com', password: 'password123', name: 'Test', username: 'TagTester')

      sign_up

      test_peep_with_tag

      expect(current_path).to eq '/peeps'
      expect(first('.tag')).to have_content 'TagTester'
    end
  end

  feature 'a user can filter peeps by tagged user' do
    scenario 'adding the same tagged user to multiple peeps then filtering by tag' do

      user = User.create(email: 'newtest@example.com', password: 'password123', name: 'Test', username: 'TagTester')

      sign_up

      test_peep_with_tag
      test_peep_with_tag2

      first('.tag').click

      expect(page).to have_content 'Test Peep'
      expect(page).to have_content 'Test Peep2'
    end
  end
end
