feature 'Index page' do
  scenario 'Default route' do
    visit '/'
    expect(page.current_path).to eq '/peeps/index'
    expect(page.status_code).to eq 200
  end
end

