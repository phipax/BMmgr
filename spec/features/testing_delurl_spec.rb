feature 'Check if the url can be deleted' do
  scenario 'Check for input to delete an entry' do
      visit('/')
      fill_in 'urlitem', with: "https://www.google.co.uk"
      click_button "Save"
      fill_in 'deleteitem', with: "4"
      click_button "Delete"
      visit('/')
      expect(page).not_to have_content "https://www.google.co.uk"
    end
end
