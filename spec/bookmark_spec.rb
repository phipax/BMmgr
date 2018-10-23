require './lib/bookmark'

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
      url = "https://www.google.co.uk"
      t.addurl(url)
      expect(t.delurl(1)).to eq "#{url} deleted successfully!"
    end
  end

end
