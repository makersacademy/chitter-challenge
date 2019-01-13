feature 'homepage' do
  scenario 'expect homepage to have header, textbox and submit button' do
    visit('/')
    expect(page).to have_content "Chitter"
    expect(page.current_path).to eq '/'
  end
end
