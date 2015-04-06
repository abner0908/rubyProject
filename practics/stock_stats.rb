#---
# Excerpted from "Programming Ruby 1.9 and 2.0",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ruby4 for more book information.
#---
require_relative 'csv_reader'

def readCsvFile(file_name, reader)
  if !File.exist?(file_name) then
    puts "Error!! #{file_name} don't exist!!"
    exit
  end
  STDERR.puts "Processing #{file_name}"
  reader.read_in_csv_data(file_name)
end

reader = CsvReader.new

if ARGV.size == 0 then
  readCsvFile('./practics/data/data.csv', reader)
else
  ARGV.each do |csv_file_name|
    readCsvFile(csv_file_name, reader)
  end
end
puts "Total value = #{reader.total_value_in_stock}"

