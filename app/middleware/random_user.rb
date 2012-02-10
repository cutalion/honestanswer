class RandomUser
  def initialize(app)
    @app = app
  end

  def call(env)
    env['rack.session']['random_user.name'] ||= names[rand(names.length)]
    env['rack.session']['random_user.id']   ||= Digest::MD5.hexdigest(rand(999999999999999).to_s)
    @app.call(env)
  end

  def names
    names_list.split(/\n/).map(&:strip).delete_if(&:blank?)
  end

  def names_list
    <<-NAMES
      Pongo
      Roger
      Anita
      Perdita
      Cruella de Vil
      Tibbs
      Colonel
      Horace
      Jasper 

      Flik
      Dot
      Princess Atta
      Hopper
      Molt
      P.T. Flea
      The Queen
      Heimlich 

      Goofy
      Max Goof
      Pete
      Peg
      Pistol
      Pete Junior
      Chainsaw 

      Abu
      Aladdin
      Genie
      Princess Jasmine
      Rajah
      Magic Carpet
      The Sultan 

      Beast
      Belle
      Gaston
      Maurice
      Lumiere
      Mrs. Potts
      Cogsworth
      Chip 

      Chick Hicks
      Lightning McQueen
      Mack
      Doc Hudson
      Sally Carrera
      The King 

      Chicken Little
      Buck "Ace" Cluck
      Abby Mallard
      Runt
      Fish Out of Water
      Foxy Loxy
      Goosey Loosey
      Kirby 

      Cinderella
      Lady Tremaine
      Drizella
      Anastasia
      Fairy Godmother
      Bruno
      Major
      Jaq
      Octavius
      Prince Charming
      King of Duke 

      Chip
      Dale
      Fat Cat
      Gadget Hackwrench
      Monterey Jack
      Professor Norton Nimnul
      Zipper the Fly 

      Scrooge McDuck
      Huey
      Dewey
      Louie
      The Beagle Boys
      Magica De Spell
      Flintheart Glomgold
      Launchpad McQuack
      Webby Vanderquack
      Mrs. Bentina Beakley
      Duckworth the Butler 

      Marlin
      Coral
      Nemo
      Dory
      Bruce
      Anchor
      Chum
      Darla
      Gill
      Squirt
      Crush
      Nigel
      The Dentist  

      Zeus
      Hercules
      Hera
      Hermes
      Hades
      Pain
      Panic
      Alcmene 
      Amphitryon
      Pegasus
      Phil
      Megara
      Nessus 

      Mr. Incredible
      Elastigirl
      Dash
      Violet
      Jack-Jack
      Frozone
      Mirage
      Edna
      Bomb Voyage
      Syndrome 

      Akela
      Bagheera
      Baloo
      Colonel Hathi
      Mowgli
      Kaa
      King Louie
      Shanti
      Shere Khan 

      Simba
      Scar
      Mufasa
      Timon
      Pumbaa
      Nala
      Rafiki
      Zazu
      Shenzi
      Banzai
      Ed
      Sarabi
      Sarafina
      Kiara
      Kovu
      Zira
      Nuka
      Vitani
      The "Unique Outsiders"
      Ma
      Uncle Max 

      King Triton
      Ariel
      Flounder
      Sebastian
      Ariel's Sisters
      Prince Eric
      Urchin
      Evil Manta 

      Mickey Mouse
      Minnie Mouse
      Goofy
      Pluto
      Donald Duck
      Daisy Duck 

      Sully
      Randall
      Mike
      Boo
      Mr. Waternoose 

      Peter Pan
      Tinker Bell
      John
      Wendy
      Captain Hook
      The Crocodile
      George Darling
      The Lost Boys
      Mary Darling
      Michael
      Nana
      Smee
      Tiger Lily
      Lost boys 

      Jiminy Cricket
      Pinocchio
      Geppetto
      Figaro
      Cleo
      Foulfellow the Fox
      Stromboli
      Gideon the Cat
      The Blue Fairy
      Lampwick
      Monstro
      The Coachman 

      Governor Ratcliffe
      John Smith
      Thomas
      Pocahontas
      Kocoum
      Grandmother Willow
      Chief Powhatan
      Nakoma 

      Alfredo Linguini
      Colette
      Emile
      Remy 

      King Richard
      Prince John
      Robin Hood
      Little John
      Sheriff of Nottingham
      Friar Tuck
      Maid Marian
      Sir Hiss
      Trigger
      Nutsey
      Skippy 

      Aurora/Briar Rose
      King Stefan
      Queen Leah
      Prince Philip
      King Hubert
      Fauna
      Flora
      Merryweather
      Maleficent
      Diablo the Raven 

      Bashful
      Doc
      Dopey
      Grumpy
      Happy
      The Magic Mirror
      The Prince
      Queen
      Sleepy
      Sneezy
      Snow White 

      Baloo
      Kit Cloudkicker
      Shere Khan
      Louie
      Don Karnage
      Molly Cunningham
      Rebecca Cunningham 

      Kala
      Kerchak
      Tarzan
      Tantor
      Terkina (Terk)
      Professor Archimedes Q. Porter
      Mr. Clayton
      Jane 

      Al
      Andy
      Bullseye
      Bo Peep
      Buzz Lightyear
      Ham
      Jessie
      Mr. Potatohead
      Mrs. Potatohead
      Rex
      Sarge
      Sid
      Slinky
      Stinky Pete, the prospector
      Wheezy
      Woody 

      Winnie the Pooh
      Piglet
      Rabbit
      Tigger
      Eeyore
      Kanga
      Roo
      Lumpy
    NAMES
  end
end
