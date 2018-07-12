
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrap2
    list = []

    page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))


    names = page.css(".currency-name-container").css(".link-secondary").map{|name| name.text }
    price = page.css(".price").map {|price| price.text }

    names.length.times do |i|
        list += [{'name' => names[i], 'price' => price[i]}]
        i += 1
    end
    return list

end

puts scrap2

