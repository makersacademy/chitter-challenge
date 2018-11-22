feature 'testing framework' do

  scenario 'index page loads and capybara works' do
    visit('/')
    expect(page.status_code).to be(200)
  end

end
