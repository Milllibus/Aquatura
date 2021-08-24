require 'nokogiri'
require 'open-uri'


class Scraper
  def scrap
    plant_name = "jacinthe"
    url = "https://jardinage.ooreka.fr/plante/recherche?motsClefs=#{plant_name}"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    plant = html_doc.search(".info_plante").first
    plant_name = plant.text.strip
    plant_watering = plant.search('.caracteristique')[1].search('span').attr('class').value
    p  "============"
    p plant_name
    p plant_watering
    p  "========="
  end
end

scrape = Scraper.new
scrape.scrap
