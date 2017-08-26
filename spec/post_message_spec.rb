require './app.rb'

feature 'There is a homepage' do
  scenario 'Homepage which will contain list of posts' do
    visit '/home'
    expect(page.status_code).to eq 200
  end
end
