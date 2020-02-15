class DataImport
  require 'open-uri'
  require 'csv'

  # To-Do
  # Read data from google sheet
  def self.create_records(klass,url)
    begin
      CSV.new(open(url), :headers => :first_row).each do |line|
        klass.constantize.create(line.to_hash)
      end
    rescue => e
      puts "DataImport Error: #{e}"
    end
  end

  
end