# frozen_string_literal: true

class View
  def create_gossip
    author = get_non_empty_input('author')
    return if author.nil?

    content = get_non_empty_input('content')
    return if content.nil?

    { 'author' => author, 'content' => content }
  end

  private

  def get_non_empty_input(field_name)
    input = nil
    loop do
      puts "#{field_name}: "
      input = gets.chomp
      break if input.strip != '' # Exit the loop if input is not empty

      puts "#{field_name} cannot be empty. Please enter a valid #{field_name} or type 'exit' to quit."
      return nil if input.downcase == 'exit'
    end
    input
  end
end
