feature 'viewing homepage' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
