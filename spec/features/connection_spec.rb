feature 'connection' do

  scenario "are we able to connect to the homepage?" do
    visit '/'
    expect(page).to have_content 'Chitter'
  end

end
