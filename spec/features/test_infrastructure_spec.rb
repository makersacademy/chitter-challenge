feature 'testing' do
  scenario 'infrastructre' do
    visit('/')
    expect(page).to have_content('it\'s working :D')
  end
end  