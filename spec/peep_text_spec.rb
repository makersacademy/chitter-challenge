feature 'Viewing first page' do

  scenario 'I see the first page' do
    visit('/')
    expect(page).to have_content()
  end

  scenario 'I see a latest peeps button' do
    visit('/')
    click_button("Latest peeps")
    #expect(page).to have_content($peeps)
  end

  
end
