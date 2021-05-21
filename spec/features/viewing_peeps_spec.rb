feature 'viewing peeps' do
  scenario ' / redirects to /chitter' do
    visit('/')
    expect(current_path).to eq '/chitter'
  end
  scenario 'can view all peeps' do
    
  end
end