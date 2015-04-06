#---
# Excerpted from "Programming Ruby 1.9 and 2.0",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ruby4 for more book information.
#---
def count_frequency(word_list, counts)
  ignore_list = %w[it its she her he him his they them their i me my you your we us our any]
  ignore_list += %w[is be been are was were has have had will would can could do did]
  ignore_list += %w[what when where which who whom there here that this these]
  ignore_list += %w[for by from at with on to of in into out up down upon back all also about]
  ignore_list += %w[ms mrs mr miss no not most more than one an the before after yet so if and as but or then]
  ignore_list += ('a'..'z').to_a
  word_list = word_list - ignore_list
  for word in word_list
    counts[word] += 1
  end
  counts

end

#---
# Excerpted from "Programming Ruby 1.9 and 2.0",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ruby4 for more book information.
#---
def words_from_string(string)
  string.downcase.scan(/[\w']+/)
end

input = ARGV.shift.to_i

if input.is_a? Integer and input > 0 then
  rankSize = input
else
  rankSize = 10
end

counts = Hash.new(0)

fileNmae = File.dirname(__FILE__) + '/data/Womens_Suffrage.txt'
if !File.exist?(fileNmae) then
  puts 'Error!! ' + fileNmae + ' don\'t exist'
  exit
end

file = File.open(fileNmae)
file.each do |line|
  word_list = words_from_string(line)
  count_frequency(word_list, counts)
end
file.close

sorted = counts.sort_by{|word, count| count}.reverse
top_list = sorted.first(rankSize)

top_list.each{|word, count| puts "#{word}: #{count}"}
puts "#{top_list.size}/#{sorted.size}"