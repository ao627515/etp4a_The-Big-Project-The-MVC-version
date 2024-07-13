require 'csv'
require 'json'

class Gossip # rubocop:disable Style/Documentation
  attr_accessor :content, :author

  def initialize(author, content)
    @content = content
    @author = author
  end

  # Save the gossip as a CSV entry
  def save_as_csv
    file_path = File.expand_path('../db/gossip.csv', __dir__)
    begin
      CSV.open(file_path, 'a') do |csv|
        csv << [author, content]
      end
      puts "Les gossips ont été sauvegardés dans #{file_path}"
    rescue StandardError => e
      puts "Erreur lors de la sauvegarde en CSV: #{e.message}"
    end
  end

  # Save the gossip as a JSON entry
  def save_as_json
    file_path = File.expand_path('../db/gossip.json', __dir__)
    begin
      existing_gossips = load_from_json(file_path)
      existing_gossips << { author:, content: }
      save_to_json(existing_gossips, file_path)
      puts "Les gossips ont été sauvegardés dans #{file_path}"
    rescue StandardError => e
      puts "Erreur lors de la sauvegarde en JSON: #{e.message}"
    end
  end

  # Index gossips from CSV
  def self.index_gossip_csv
    file_path = File.expand_path('../db/gossip.csv', __dir__)
    gossips = []
    if File.exist?(file_path)
      CSV.foreach(file_path) do |row|
        gossips << Gossip.new(row[0], row[1])
      end
    end
    gossips
  end

  # Index gossips from JSON
  def self.index_gossip_json
    file_path = File.expand_path('../db/gossip.json', __dir__)
    gossips = []
    if File.exist?(file_path)
      existing_gossips = load_from_json(file_path)
      existing_gossips.each do |gossip|
        gossips << Gossip.new(gossip[:author], gossip[:content])
      end
    end
    gossips
  end

  private

  # Load existing gossips from JSON file
  def self.load_from_json(file_path)
    if File.exist?(file_path)
      file_content = File.read(file_path)
      JSON.parse(file_content, symbolize_names: true)
    else
      []
    end
  end

  # Save gossips to JSON file
  def self.save_to_json(gossips, file_path)
    File.open(file_path, 'w') do |file|
      json_data = JSON.pretty_generate(gossips)
      file.write(json_data)
    end
  end
end
