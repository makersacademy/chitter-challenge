feature 'viewing links' do
  before do
    sign_up
  end

  scenario 'there is a list of links on the homepage' do
    Peep.create(name: 'Sam', user_name: 'sammybo1', peep: "Hello Chitter", time: '12:00')
    visit '/home' # Visit the links URL
    expect(page.status_code).to eq 200 # Sanity check to ensure can load the page.
    expect(page).to have_content('Hello Chitter')
  end
end
