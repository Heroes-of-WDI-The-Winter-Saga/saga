puts "Welcome to Kyle's Game"
puts ""
puts "Please enter your hero's name."
player_name = gets.chomp

hero = {
  "lvl" => 1,
  "health" => 10,
  "name" => player_name

}

puts "Welcome " + hero["name"]
puts "Prepare for combat"

while hero["health"] > 0
  def monster_generator(nam,lvl)
    monster = {
      "name" => nam,
      "lvl" => lvl,
      "health" => 10 + lvl
    }
    return monster
  end
  enemy_names = ["troll", "ogre" , "ninja" , "GA WDI Zelda student" , "guy with a sharp stick" ,
    "thug","snakeman" , "out of control robot" ]

  opponent = enemy_names.sample
  opponent = monster_generator(opponent , hero["lvl"])
  puts "A #{opponent["name"]} approaches, do you wish to fight, or flee?"
  puts "type fight to do battle , type 'flee' to avoid battle and lose two points of health"
  puts "Your hero's health is #{hero["health"]}"
  puts "Your hero's level is #{hero["lvl"]}"
  reply = gets.chomp.downcase
  while reply != "fight" && reply != "flee"
    puts "incorrect reply, fight or flee"
    reply = gets.chomp.downcase
  end

  while reply == "fight" && hero["health"] > 0

    if opponent["health"] > 0 && hero["health"] > 0
      puts "#{hero["name"]} attacks the #{opponent["name"]}"

      if 1 + rand(5) > 1
        dmg = 1 + rand(4)
        opponent["health"] = opponent["health"] - dmg
        puts "#{hero["name"]} strikes the #{opponent["name"]} for #{dmg} points of damage."
      else
        puts "You have missed."
      end

      if opponent["health"] > 0
        puts "The #{opponent["name"]} is attacking"
        if 1 + rand(5) > 2
          dmg = 1+ rand(3)
          hero["health"] = hero["health"] - dmg
          puts "The #{opponent["name"]} has struck you for #{dmg}"
          puts "#{hero["name"]} has #{hero["health"]} health left"
        else puts "The #{opponent["name"]} has missed you"
        end
        if hero["health"] > 0
          p "Do you wish to continue to 'fight', or do you wish to 'flee'?"
          reply = gets.chomp.downcase

          while reply != "fight" && reply != "flee"
            puts "incorrect reply, fight or flee"
            reply = gets.chomp.downcase
          end
        end
      else puts "You have defeated your opponent."
        hero["lvl"] = hero["lvl"] + 1
        hero["health"] = 10 + hero["lvl"]
        reply = ""
      end

    end
  end

  if reply == "flee"
     puts "You run to fight another day."
     if hero["health"] > 2
       hero["health"] = hero["health"] - 2
     end
  end





end

p "Your hero has died."
