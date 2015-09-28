feature 'Creating peeps' do

  include Helpers

  scenario 'I can create a new peep' do
    user = create(:user)
    sign_in(user)
    visit '/peeps/new'
    fill_in 'message', with: 'My first peep'
    click_button 'Create Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('My first peep')
    end
  end

  scenario 'there are no links in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

end
