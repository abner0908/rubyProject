require 'open-uri'

def spiderFor(url)
  open(url) do |f|
    lines = f.readlines
    total = 0
    lines.each do |line|
      urls = find_url(line)
      urls.each_with_index {|url, index| puts "#{total + index + 1}: #{url}"}
      total += urls.count
    end
    puts "total: #{total}"
  end
end

def find_url(line)
  urls = []
  tag_s = %Q(<a href=")
  tag_e = %Q(")

  index_s = 0
  index_e = 0

  while index_e < line.length do
    index_s = line.index(tag_s, index_s)
    if index_s then
      index_s += %(<a href=").length
      index_e = line.index(tag_e, index_s) - 1
      url = line[index_s..index_e]

      if not url.index('http://') then
        url = @url + url
      end

      urls << url
    else
      break
    end
  end

  urls
end

input = ARGV.shift.to_s

if input.length > 0 then
  @url = input.strip
else
  @url = 'http://www.ruby-doc.org/core-2.1.5/'
end

try_cnt = 0
try_max = 3 # How many times have we tried to read the URL

begin
  try_cnt += 1
  spiderFor(@url)
rescue OpenURI::HTTPError => ex # If we get an HTTP error
  puts ex.message # Print the error message
  if (try_cnt <= try_max)
    sleep(2**try_cnt) # Wait for 2, 4, or 8 seconds
    retry
  elsif tries >= 4 then
    puts "Open url is failed!!"
  end
end