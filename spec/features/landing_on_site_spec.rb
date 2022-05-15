feature "Landing on site" do
  scenario 'user open first page' do
    visit('/')
    expect(page).to have_current_path('/peep')
  end
end