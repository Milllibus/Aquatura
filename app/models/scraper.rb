require 'nokogiri'
require 'open-uri'
require 'json'

# rubocop:disable Metrics/MethodLength
class Scraper
  def scrap(plant_name)
    url = "https://www.monrovia.com/catalogsearch/result/?q=#{plant_name}"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    search_item = html_doc.search('.product-item-photo').first
    plant_url = search_item.attribute('href').value

    plant_html_file = URI.open(plant_url).read
    plant_html_doc = Nokogiri::HTML(plant_html_file)

    plant_name = plant_html_doc.search('.base').text.strip
    plant_description = plant_html_doc.search('.overview').text.strip
    plant_image_url = plant_html_doc.search('.gallery-placeholder img').first.attribute('src').value
    # plant_watering = plant.search('.caracteristique')[1].search('span').attr('class').value

    return {
      name: plant_name,
      description: plant_description,
      image_url: plant_image_url
    }
  end
  # rubocop:enable Metrics/MethodLength

  def weather
    city = "Marseille"
    api_k = "3a84afc0cbb1319754a397547de8202e"
    url = "api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_k}"

    html_file = URI.open(url).read
    weather = JSON.parse(html_file)

    puts weather['weather']
  end
end

scraper = Scraper.new
scraper.weather
