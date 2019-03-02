feature 'Initializing app' do
  scenario 'visits landing page' do
    visit '/'
    expect().to have_contest("Welcome to Chitter")
  end

end
