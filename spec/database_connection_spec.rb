require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a databse through PG' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')

      DatabaseConnection.setup('makersbnb_test')
    end

  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('makersbnb_test')
      expect(connection).to receive(:exec_params).with("SELECT * FROM bookmarks;", [])
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end

end