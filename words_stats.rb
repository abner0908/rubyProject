require_relative "words_from_string.rb"
require_relative "count_frequency.rb"

counts = Hash.new(0)

file = File.open('Taylor.txt')
file.each do |line|
  word_list = words_from_string(line)
  #counts = count_frequency(word_list, counts)
  count_frequency(word_list, counts)
end
file.close

sorted = counts.sort_by {|word, count| count}
top_list = sorted.last(5)

top_list.reverse_each{|word, count| puts "#{word}: #{count}"}