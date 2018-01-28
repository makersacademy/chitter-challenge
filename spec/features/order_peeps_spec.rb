RSpec::Matchers.define :appear_before do |later_content|
  match do |earlier_content|
    page.body.index(earlier_content) < page.body.index(later_content)
  end
end

feature 'display peeps' do
  scenario 'peeps appear in reverse date order' do
    Peep.create(peep_text: 'Hello')
    Peep.create(peep_text: 'CatFace')
    Peep.create(peep_text: 'Bazaar')
    visit '/peeps'
    expect(page.find('li:first-child')).to have_content 'Bazaar'
  end
end
