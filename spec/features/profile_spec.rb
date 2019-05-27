feature 'viewing and posting peeps' do

  scenario 'it has a peep list and fields to post' do
    visit('/')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Hello, Chitter')
  end
  
end
