feature 'Testing the basic web-page' do
  scenario 'Checking for the landing page of the Bookmarks Manager' do
    visit('/')
    expect(page).to have_content 'Welcome to the Bookmark Central!'
  end
end
