require "selenium-webdriver"
require 'pry'

PokemonProduct = Struct.new(:url, :image, :name, :price)

pokemon_products = []

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument("--headless")

driver = Selenium::WebDriver.for :chrome, options: options

driver.navigate.to "https://scrapeme.live/shop/"
pagination_element = driver.find_element(:css, "a.page-numbers")

html_products = driver.find_elements(:css, "li.product") #find all css elements that are li.product

html_products.each do |html_product|
    url = html_product.find_element(:css, "a").attribute("href")
    image = html_product.find_element(:css, "img").attribute("src")
    name = price = html_product.find_element(:css, "h2").text
    price = html_product.find_element(:css, "span").text

    pokemon_product = PokemonProduct.new(url, image, name, price)
    pokemon_products << pokemon_product
end 

pagination_element.click
puts driver$title

html_products = driver.find_elements(:css, "li.product")

html_products.each do |html_product|
    url = html_product.find_element(:css, "a").attribute("href")
    image = html_product.find_element(:css, "img").attribute("src")
    name = price = html_product.find_element(:css, "h2").text
    price = html_product.find_element(:css, "span").text

    pokemon_product = PokemonProduct.new(url, image, name, price)
    pokemon_products << pokemon_product
end 

driver.quit




