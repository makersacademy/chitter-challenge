feature 'Create peeps' do

  scenario 'Post a new peep' do
    sign_up
    create_peep('My very first peep')

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('My very first peep')
    end
  end
end
