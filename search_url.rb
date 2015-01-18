require 'open-uri'

def spiderFor(url)
  open(url) do |f|
    lines = f.readlines
    total = 0
    lines.each do |line|
      urls = find_url(line)
      urls.each {|url| puts url}
      total += urls.count    
    end
    puts total
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

@url = 'http://www.ruby-doc.org/core-2.1.5/'
@url = 'http://www07.eyny.com/'
#url = 'http://www.example.com/123/'
tries = 0 # How many times have we tried to read the URL

begin # This is where a retry be3gins
  tries += 1 # Try to print out the contents of a URL
  #open(url) {|f| puts f.readlines }
  spiderFor(@url)
rescue OpenURI::HTTPError => e # If we get an HTTP error
  puts e.message # Print the error message
  if (tries < 4) # If we haven't tried 4 times yet...
    sleep(2**tries) # Wait for 2, 4, or 8 seconds
    retry # And then try again!
  elsif tries >= 4 then
    puts "Open url is failed!!"
  end
end