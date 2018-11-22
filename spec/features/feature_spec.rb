require 'pry'
feature 'user journey' do
  scenario 'the app shows a homepage' do
    visit("/")
    binding.pry
    expect(page).to have_content("Hello world")
  end
end
