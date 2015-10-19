feature 'Can get into site' do

  scenario '/ redirects to /chits' do
    visit '/'
    expect(current_path).to eq '/chits'
    expect(page.status_code).to eq 200
  end

  scenario '/sessions/new redirects to /chits' do
    visit '/sessions/new'
    expect(current_path).to eq '/chits'
    expect(page.status_code).to eq 200
  end

end
