feature 'Chitter' do

  scenario 'seeing a home page' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end

end
