# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting new Peeps' do
  scenario 'I want to write a Peep on new peep page' do
    make_new_peep_feature
    within 'ul#peeps' do
    expect(page).to have_content "Remainers claim that leaving the EU.."
    end
  end
end
