# require 'pry'

party = {
  "hero" => [10,5,5]
}


npc = {
  "enemy" => [6,4,4],
  "name" => ["Tyler","Sean"]
}

def battle(party, npc)

  totalhp = party["hero"][0]
  enemyhp = npc["enemy"][0]
  hstr = party["hero"][1]
  estr = npc["enemy"][1]
  hdef = party["hero"][2]
  edef = npc["enemy"][2]

  while party["hero"][0] > 0 || npc["enemy"][0] > 0
    p "How will you proceed? Attack, block or run?"
    input = gets.chomp.downcase

    if input == "attack"
      if 1+rand(5) == 1
        p "Your attack missed."
      elsif 1+rand(5) != 1
        edamage = 1 + rand(hstr)
      end
    elsif input == "block"
      hdef = hdef *2
      p "You are blocking."
    elsif input == "run"
      party["hero"][0] = party["hero"][0] - 2
      p "You escape! You have lost 2 health during your escape!"
      story(party,npc) #should initiate story fuction
    elsif input != "run" || input != "attack"
      p "That is an inproper command try again."
      # story(party,npc)
    end

    if npc["enemy"][0] > enemyhp/2
      if 1 + rand(10) == 10
        edef = edef * 2
      else
        if 1+rand(5) <= 2
        p "The enemies attack misses!"
        elsif 1+rand(5) >= 3
          hdamage = 1 + rand(estr)
        end
      end
    else
      if 1 + rand(2) == 1
        eblock = edef * 2
      else
        if 1+rand(5) <= 2
          p "The enemies attack misses!"
        elsif 1+rand(5) >= 3
          hdamage = 1 + rand(estr)
        end
      end

      edamage = edamage - edef
          if edamage <= 0
            p "Your attack failed!"
            edamage = 0
          else
            p "You hit for #{edamage} damage!"
          end

      hdamage = hdamage - hdef
          if hdamage <= 0
            p "The enemies attack has failed!"
            hdamage = 0
          else
            p "You've been hit for #{hdamage} damage!"
          end

    end

    
    party["hero"][0] = party["hero"][0] - hdamage.to_i
    npc["enemy"][0] = npc["enemy"][0] - edamage.to_i
    p "You have #{party["hero"][0]} health."
    p "The enemy has #{npc["enemy"][0]} health"

    if npc["enemy"][0] <= 0
      p "You have defeated the enemy!"
      party["hero"][0] = totalhp
      npc["enemy"][0] = enemyhp
      story(party, npc)
    end

  end

end

def story(party, npc)
# binding.pry

  while party["hero"][0] >= 1

    p "A #{npc["name"][1+rand(1)]} is approaching. (Will you \"fight\" or \"flee\")"

    input = gets.chomp.downcase

    if input == "flee"
      party["hero"][0]  = party["hero"][0] - 2

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
