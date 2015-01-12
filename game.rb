puts "Welcome to Kyle's Game"
puts ""
puts "Please enter your name."
hero{
  lvl => 1,
  health => 10
}
hero[name] = gets.chomp
puts "Welcome " + hero["name"]
puts "prepare yourself for combat"

hero[lvl] = 1
hero[health] = 10 + hero[lvl]

puts hero
puts "Prepare for battle and adventure brave "
# while hero["health"] > 0
#
# end


# def battle(player , opponent)
#
#   while player["hero"][0] > 0 && opponent["enemy"][0] > 0
#     p "How will you proceed? (Attack? Cast a spell? or run?)"
#     if gets.chomp.downcase == "attack"
#       if 1+rand(5) < 2
#         p "Your attack missed."
#       else
#         edamage = 2 + rand(3)
#         p "You hit for #{edamage} damage!"
#         opponent["enemy"][0] = opponent["enemy"][0] - edamage
#       end
#
#       if 1+rand(5) <= 2
#           p "The enemies attack misses!"
#         else
#           hdamage = 1 + rand(3)
#           p "You've been hit for #{hdamage} damage!"
#         end
#
#       if gets.chomp.downcase == "run"
#         party["hero"][0] = party["hero"][0] - 2
#         story #should initiate story fuction
#       end
#     else
#       p "That is an inproper command try again."
#     end
#
#     party["hero"][0] = party["hero"][0] - hdamage
#     npc["enemy"][0] = npc["enemy"][0] - edamage
#     p "You have #{party["hero"][0]} health."
#     p "The enemy has #{npc["enemy"][0]} health"
#   end
#   if npc["enemy"][0] <= 0
#     p "You have defeated the enemy!"
#   end
# end
#
# def story
#   while party["hero"][0] >= 1
#
#     p "A #{npc["name"][0]} is approaching. (Will you \"fight\" or \"flee\")"
# end
#     if gets.chomp.downcase == "flee"
#       party["hero"]  = party["hero"] - 2
#     end
#     if gets.chomp.downcase == "fight"
#       p "You engage the enemy!"
#       battle
#     end
#   end
#   puts "you died fucker"
# end
#
#
# p "What is your hero's name?"
# party["name"] = gets.chomp
# p "Welcome #{hero}, prepare for battle."
#
# story
