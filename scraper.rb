require "selenium-webdriver"
require 'pry'

PokemonProduct = Struct.new(:url, :image, :name, :price)

pokmemon_products = []

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument("--headless")

driver = Selenium::WebDriver.for :chrome, options: options

driver.navigate.to "https://scrapeme.live/shop/"

html_products = driver.find_elements(:css, "li.product") #find all css elements that are li.product

