feature 'Adding and viewing tags' do
  feature 'a user can add and then view a tag' do
    scenario 'a comment is added to a peep' do
      user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
      peep = Peep.create(peep: "Peeeep!", user_id: user.id)

      visit '/peeps'
      first('.peep').click_button 'Add Tag'

      expect(current_path).to eq "/peeps/#{peep.id}/tags/new"

      fill_in 'tag', with: 'test tag'
      click_button 'Submit'

      expect(current_path).to eq '/peeps'
      expect(first('.peep')).to have_content 'test tag'
    end
  end

  feature 'a user can filter peeps by tag' do
    scenario 'adding the same tag to multiple peeps then filtering by tag' do
      user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
      Peep.create(peep: "Hi Harry", user_id: user.id)
      Peep.create(peep: "Hi Sally", user_id: user.id)
      Peep.create(peep: "Hi John", user_id: user.id)

      visit('/peeps')

      within page.find('.peep:nth-of-type(1)') do
        click_button 'Add Tag'
      end
      fill_in 'tag', with: 'testing'
      click_button 'Submit'

      within page.find('.peep:nth-of-type(2)') do
        click_button 'Add Tag'
      end
      fill_in 'tag', with: 'testing'
      click_button 'Submit'

      click_link 'testing'

      expect(page).to have_content 'Hi Harry'
      expect(page).to have_content 'Hi Sally'
      expect(page).not_to have_content 'Hi John'
    end
  end
end