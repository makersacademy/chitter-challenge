feature 'Can view list of peeps' do

  scenario 'I can see existing peeps on the root page' do
    Peep.create(body: 'hello peepers', author: 'Admin') 

    visit '/'

    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('hello peepers')
    end

  end
end
