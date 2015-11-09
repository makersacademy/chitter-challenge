feature 'can see the peeps without sign in' do
  scenario 'user can see the peeps without registration' do
    visit('/')
    click_button('peeps')
    expect(current_path).to eq('/home/peeps')
  end
end
