require 'spec_helper'

feature "Creating peeps" do

  scenario 'there are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

  scenario 'I can create a new peep' do
    user = create(:user)
    sign_in(user.email, 'p@ssw0rd')

    visit '/peeps/new'
    fill_in 'content', with: 'Blah'
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Blah')
    end
  end

end
