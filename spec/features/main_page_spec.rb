feature 'main page functionality' do

  before :each do
    visit '/'
  end

  scenario 'page has a welcome message' do
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario 'page has banner' do
    expect(page).to have_xpath("//img[@src='/images/chitter_logo.png']")
  end

  scenario 'page has longcat' do
    expect(page).to have_xpath("//img[@src='/images/sidebar.gif']")
  end

end
