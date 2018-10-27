feature 'Post a peep to chitter' do

  scenario 'I can write a peep' do
    visit('/')
    visit('/post_peep')
    expect(page).to have_field("New Peep")
  end



end
