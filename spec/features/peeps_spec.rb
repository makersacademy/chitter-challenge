feature 'Displaying peeps' do
  let!(:peeps) do
    current_peeps
  end

  scenario 'A user can see all peeps in reverse chronological order
            with the name and username of the maker' do
    peek_at_peeps
    expect(page).to have_content page_content(peeps)
  end
end
