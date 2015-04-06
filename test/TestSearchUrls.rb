require 'test/unit'
require 'practics/search_url'

class TestSearchUrls < Test::Unit::TestCase
  def test_find_url
    html =  %Q(<li class="edition-international-toggle"><a href="http://international.nytimes.com" data-edition="global">International</a></li>
               <li class="edition-chinese-toggle"><a href="http://cn.nytimes.com" target="_blank" data-edition="chinese">中文</a></li>)
    urls = find_url(html)
    assert_equal("http://international.nytimes.com", urls[0])
    assert_equal("http://cn.nytimes.com", urls[1])
  end
end