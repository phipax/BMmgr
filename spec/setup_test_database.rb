require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE bookmarks;')
  # Add the test data
  connection.exec("INSERT INTO bookmarks(id,title,url) VALUES(1, 'Makers', 'http://www.makersacademy.com');")
  connection.exec("INSERT INTO bookmarks(id,title,url) VALUES(2, 'Destroy', 'http://www.destroyallsoftware.com');")
  connection.exec("INSERT INTO bookmarks(id,title,url) VALUES(3, 'Google', 'http://www.google.com');")
end
