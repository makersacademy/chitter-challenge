feature 'loads chitter home page' do
  scenario 'user accesses chitter home page' do
    visit ('/')
    expect(page).to have_content('Welcome to Chitter!')
  end
end 