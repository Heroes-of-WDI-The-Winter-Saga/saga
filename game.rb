p "What is your hero's name?"
hero = gets.chomp
p "Welcome #{hero}, prepare for battle."

party = {
  "hero" => [10]
}


npc = {
  "enemy" => [10]
}

def battle
  while party["hero"] > 0 || npc["enemy"] > 0
    p "How will you proceed? (Attack? Cast a spell? or run?)"
    if gets.chomp.downcase == "attack"
      if 1+rand(5) = 1
        p "Your attack missed."
      else
        edamage = 2 + rand(3)
        p "You hit for #{edamage} damage!"
      end
      if gets.chomp.downcase == "run"
        party["hero"] = party["hero"] - 2
        break
      end
    else
      p "That is an inproper command try again."
    end

    if 1+rand(5) <= 2
      p "The enemies attack misses!"
    else
      hdamage = 1 + rand(3)
      p "You've been hit for #{hdamage} damage!"
    end
    party["hero"] = party["hero"] - hdamage
    npc["enemy"] = npc["enemy"] - edamage
    p "You have #{party["hero"]} health."
    p "The enemy has #{npc["enemy"]} health"
  end
  if npc["enemy"] <= 0
    p "You have defeated the enemy!"
  end
end

while party["hero"] > 0

  p "A #{enemy} is approaching. (Will you \"fight\" or \"flee\")"


  if gets.chomp.downcase == "flee"
    party["hero"]  = party["hero"] - 2
  if gets.chomp.downcase == "fight"
    p "You engauge the enemy!"





  end

  puts "you died fucker"
