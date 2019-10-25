feature 'Adding and viewing tags' do
  feature 'a user can add and then view a tag' do
    let(:time) { "12:12:12" }
    scenario 'a tag is added to a bookmark' do
      peep = Peep.create(time_stamp: time, message: "I am bored right now")

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
