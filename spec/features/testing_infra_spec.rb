feature 'Testing the basic web-page' do
  scenario 'Checking for the landing page of the Bookmarks Manager' do
    visit('/')
    expect(page).to have_content 'Welcome to the Bookmark Central!'
  end

  scenario 'Checking if a new url can be added' do
    visit('/')
    fill_in 'urlitem', with: "https://www.google.co.uk"
    click_button "Save"
    visit('/')
    expect(page).to have_content "https://www.google.co.uk"
  end

  scenario 'Check for input to delete an entry' do
    visit('/')
    fill_in 'urlitem', with: "https://www.google.co.uk"
    click_button "Save"
    fill_in 'deleteitem', with: "1"
    click_button "Delete"
    visit('/')
    expect(page).not_to have_content "https://www.google.co.uk"
  end

end
