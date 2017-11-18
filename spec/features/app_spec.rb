feature "Peeps page displays all peeps" do
  scenario "Go to peeps page and view peeps in reverse chronological order" do
    Peep.create(maker: 'Oleg' massage: 'Hello World')
    visit('/peeps')
    expect(page.status_code).to eq 200
    within 'ul#links' do
    expect(page).to have_content "Hello World"
    end
  end
end


feature "Submit peep" do
  scenario "Fill in the form to send the peep and display it" do
    visit('/peeps/new')
    fill_in('maker', with: 'Oleg')
    fill_in('massage', with: 'Hello World')
    expect(page).to have_content('Hello World')
  end
end
