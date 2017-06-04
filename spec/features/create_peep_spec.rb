feature 'create peep on Chitter' do
  scenario 'new peep added to Chitter history' do
    create_new_peep
    expect(current_path).to eq('/peeps/all')
    within 'ul#peeps' do
      expect(page).to have_content 'test'
    end
  end
end
