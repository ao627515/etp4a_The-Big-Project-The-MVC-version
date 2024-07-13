require 'csv'
require 'json'
class Gossip # rubocop:disable Style/Documentation
  attr_accessor :content, :author

  def initialize(author, content)
    @content = content
    @autor = author
  end

  # Save the gossip as a CSV entry
  def save_as_csv
    file_path = File.expand_path('../db/gossip.csv', __dir__)
    begin
      CSV.open(file_path, 'a') do |csv|
        csv << [@autor, @content]
      end
      puts "Les gossips ont été sauvegardés dans #{file_path}"
    rescue StandardError => e
      puts "Erreur lors de la sauvegarde en CSV: #{e.message}"
    end
  end

  # Save the gossip as a JSON entry
  def save_as_json # rubocop:disable Metrics/MethodLength
    file_path = File.expand_path('../db/gossip.json', __dir__)
    begin
      existing_gossips = []
      if File.exist?(file_path)
        file_content = File.read(file_path)
        existing_gossips = JSON.parse(file_content) unless file_content.empty?
      end
      existing_gossips << { author: @author, content: @content }

      File.open(file_path, 'w') do |file|
        json_data = JSON.pretty_generate(existing_gossips)
        file.write(json_data)
      end
      puts "Les gossips ont été sauvegardés dans #{file_path}"
    rescue StandardError => e
      puts "Erreur lors de la sauvegarde en JSON: #{e.message}"
    end
  end
end
