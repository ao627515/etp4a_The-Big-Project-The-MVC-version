# frozen_string_literal: true

class View
  def create_gossip
    author = get_non_empty_input('auteur')
    return if author.nil?

    content = get_non_empty_input('contenu')
    return if content.nil?

    { 'author' => author, 'content' => content }
  end

  def index_gossips(gossips)
    gossips.each_with_index do |gossip, index|
      puts "#{index + 1}. #{gossip.author} : #{gossip.content}"
    end
  end

  def destroy_gossip
    get_non_empty_index('gossip à supprimer')
  end

  private

  def get_non_empty_input(field_name)
    input = nil
    loop do
      puts "#{field_name.capitalize}: "
      input = gets.chomp
      break if input.strip != '' # Sortir de la boucle si l'entrée n'est pas vide

      puts "#{field_name.capitalize} ne peut pas être vide. Veuillez saisir un #{field_name} valide ou tapez 'exit' pour quitter."
      return nil if input.downcase == 'exit'
    end
    input
  end

  def get_non_empty_index(field_name)
    input = nil
    loop do
      puts "Entrez l'indice du #{field_name}: "
      input = gets.chomp.to_i
      return input - 1 if input.to_i > 0 # Retourner l'indice (base zéro) si l'entrée est valide

      puts "Entrée invalide. Veuillez saisir un indice valide pour #{field_name} ou tapez 'exit' pour quitter."
      return nil if input.to_s.downcase == 'exit'
    end
  end
end
