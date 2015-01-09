# require 'pry'

party = {
  "hero" => [10]
}


npc = {
  "enemy" => [10],
  "name" => ["Tyler","Sean"]
}

def battle(party, npc)

  while party["hero"][0] > 0 || npc["enemy"][0] > 0
    p "How will you proceed? Attack or run?"
    input = gets.chomp.downcase

    if input == "attack" && 1+rand(5) == 1
        p "Your attack missed."
    elsif input == "attack" && 1+rand(5) != 1
       edamage = 2 + rand(3)
      p "You hit for #{edamage} damage!"
    end

    if input == "attack" && 1+rand(5) <= 2
      p "The enemies attack misses!"
    elsif input == "attack" && 1+rand(5) >= 3
      hdamage = 1 + rand(3)
      p "You've been hit for #{hdamage} damage!"
    end

    if input == "run"
      party["hero"][0] = party["hero"][0] - 2
      story(party,npc) #should initiate story fuction
    end

    # if input != "run" || input != "attack"
    #   p "That is an inproper command try again."
    #   story(party,npc)
    # end

    party["hero"][0] = party["hero"][0] - hdamage.to_i
    npc["enemy"][0] = npc["enemy"][0] - edamage.to_i
    p "You have #{party["hero"][0]} health."
    p "The enemy has #{npc["enemy"][0]} health"

    if npc["enemy"][0] <= 0
      p "You have defeated the enemy!"
      story(party, npc)
    end

  end

end

def story(party, npc)
# binding.pry

  while party["hero"][0] >= 1

    p "A #{npc["name"][0]} is approaching. (Will you \"fight\" or \"flee\")"

    input = gets.chomp.downcase

    if input == "flee"
      party["hero"]  = party["hero"] - 2

    elsif input == "fight"
      p "You engage the enemy!"
      battle(party, npc)
    end
  end
  puts "you died fucker"
end


p "What is your hero's name?"
hero = gets.chomp
p "Welcome #{hero}, prepare for battle."

story(party, npc)
