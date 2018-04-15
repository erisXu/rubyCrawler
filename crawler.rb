require 'nokogiri'
require 'open-uri'
require 'csv'

def encodeURIComponent(foo)
  puts URI.escape(foo, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
end

def findElementByAttr(selector)
  url = 'https://movie.douban.com/top250'
  # encodeURIComponent('https://www.douban.com/search?q=' + keyword)
  charset = nil

  html = open(url) do |f|
    charset = f.charset
    f.read
  end

  doc = Nokogiri::HTML.parse(html, nil, charset)
  doc.css(selector).each do |node|
    p node.inner_text, "\n"
  end
end

findElementByAttr('.title')
