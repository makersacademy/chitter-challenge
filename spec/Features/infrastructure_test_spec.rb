feature 'Testing infrastructure' do

  scenario 'Can run app' do
    visit('/')
    expect(page.status_code).to eq(200)
  end
end
