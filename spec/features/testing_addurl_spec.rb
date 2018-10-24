feature 'Checking for adding URL' do
  scenario 'Checking if a new url can be added' do
    visit('/')
    fill_in 'urlitem', with: "http://www.google.com"
    click_button "Save"
    visit('/')
    expect(page).to have_content "http://www.google.com"
  end
end
