require_relative 'controller'

class Router # rubocop:disable Style/Documentation
  def initialize
    @controller = Controller.new
  end

  def perform # rubocop:disable Metrics/MethodLength
    puts 'BIENVENUE DANS THE GOSSIP PROJECT'
    loop do
      puts "Tu veux faire quoi jeune mouss' ?"
      puts '1. Je veux créer un gossip'
      puts "4. Je veux quitter l'app"
      params = gets.chomp.to_i

      case params
      when 1
        puts 'Tu as choisi de créer un gossip'
        @controller.create_gossip
      when 4
        puts 'À bientôt !'
        break
      else
        puts "Ce choix n'existe pas, merci de ressayer"
      end
    end
  end
end
