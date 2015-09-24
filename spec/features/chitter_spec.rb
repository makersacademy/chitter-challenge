feature 'application setup' do
  feature 'root path' do
    scenario 'is sucessfull' do
      visit '/'
      expect(page.status_code).to be 200
    end
  end
end