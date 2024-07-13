require_relative 'controller'

class Router
  def initialize
    @controller = Controller.new
  end

  def perform
    puts 'BIENVENUE DANS THE GOSSIP PROJECT'
    loop do
      puts "Que veux-tu faire jeune mouss' ?"
      puts '1. Créer un gossip'
      puts '2. Voir la liste des gossips'
      puts '3. Supprimer un gossip'
      puts "4. Quitter l'application"
      params = gets.chomp.to_i

      case params
      when 1
        puts 'Tu as choisi de créer un gossip'
        @controller.create_gossip
      when 2
        puts 'Tu as choisi de voir la liste des gossips'
        @controller.index_gossips
      when 3
        puts 'Tu as choisi de supprimer un gossip'
        @controller.destroy_gossip
      when 4
        puts 'À bientôt !'
        break
      else
        puts 'Ce choix n\'existe pas, merci de réessayer'
      end
    end
  end
end
