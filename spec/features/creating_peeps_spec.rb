feature 'Creating peeps' do
  scenario 'I can create a new peep' do
    create_a_peep
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content 'A peep with a hashtag'
    end
  end
end
