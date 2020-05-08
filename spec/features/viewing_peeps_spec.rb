feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(current_path).to eq '/peeps'
  end
end
