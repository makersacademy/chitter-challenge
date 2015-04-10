feature 'User browses the list of blabbs' do

  before(:each) do
    Blabbs.create(message: 'Sample blabb message here')
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('Sample blabb message here')
  end
end