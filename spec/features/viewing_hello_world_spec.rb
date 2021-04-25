feature "Viewing Hello world" do
  scenario 'visiting the page' do
    visit('/')
    expect(page).to have_content 'Hello World'
  end
end
  