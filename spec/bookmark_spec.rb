require './lib/bookmark'
require './spec/setup_test_database'

describe 'Initialize BookMark class' do
  context 'Check for the class object' do
    it 'Class BookMark#Initialize Method' do
      expect(Tracker.new).to be_instance_of(Tracker)
    end
  end

  context 'Check for the BookMark object exposed Methods' do
    it '#addurl' do
      t = Tracker.create
      url = "https://www.google.co.uk"
      expect(t.addurl(url)).to eq "#{url} added successfully!"
    end
  end

  context 'Delete an entry' do
    it '#delurl' do
      t = Tracker.create
      bookmark = t.delurl(1)
      expect(bookmark).not_to include('http://www.makersacademy.com')
    end

    context 'returns all the entries from DB' do
      it '#dbfetch' do
        t = Tracker.create
        bookmarks = t.dbfetch
        expect(bookmarks).to include('http://www.makersacademy.com')
        expect(bookmarks).to include('http://www.destroyallsoftware.com')
        expect(bookmarks).to include('http://www.google.com')
      end
    end

  end

end
