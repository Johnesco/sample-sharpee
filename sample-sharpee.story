## Sample — a practice game for learning Chord: rooms, objects, and
## interactions. Translated on 2026-09-08 from the Inform 7 "Sample"
## (C:/code/text-games/i7/sample/story.ni): the same six rooms, the same
## four discoveries, the same ten points and ranks, the same help system.

story
  title: Sample (Sharpee)
  authors:
    John Googol
  id: sample-sharpee
  story-version: 1.0.0
  ifid: 1AE6F749-2CEB-446A-A4CE-2F6153B289B4
  description: A practice game for learning Chord: rooms, objects, and interactions.
  themes: modern-dark, retro-terminal, paper, system-6
  score journal-read worth 2
  score coin-taken worth 2
  score ring-found worth 3
  score locket-taken worth 3
  use scoring
    rank "Beginner" at 0
    rank "Explorer" at 5
    rank "Winner" at 10

  on every turn while the dusty journal is consulted and the rusty coin is polished and the golden ring is found and the silver locket is glowing
    win victory
  end on

## ===========================================================================
## ROOMS
## ===========================================================================

create the Entrance Hall
  a room
  aka hall
  north to the Library
  east to the Kitchen
  south to the Garden

  A grand hall with marble floors and high ceilings. A crystal chandelier
  hangs overhead. Exits lead north to a library, east to a kitchen, and
  south to a garden.

create the Library
  a room
  up to the Study

  Tall bookshelves line every wall, crammed with leather-bound volumes. A
  reading desk sits in the center of the room. A narrow staircase leads up.

create the Study
  a room

  A cozy room at the top of the narrow staircase. A wooden cabinet stands
  against one wall. The only exit is back down.

create the Kitchen
  a room

  A rustic kitchen with a stone hearth and a heavy wooden table. The smell
  of old spices lingers in the air. A doorway leads west back to the hall.

create the Garden
  a room
  south to the Pond

  A walled garden overgrown with ivy and wildflowers. A stone fountain
  stands in the center, dry and cracked. A path continues south to a pond.

create the Pond
  a room

  A small, murky pond surrounded by reeds and flat stones. The water is
  still and dark. The garden lies back to the north.

## ===========================================================================
## THE PLAYER
## ===========================================================================

create the adventurer
  a person
  playable
  aka me, myself, self
  starts in the Entrance Hall

  As good-looking as ever.

## ===========================================================================
## THE ENTRANCE HALL
## ===========================================================================

create the crystal chandelier
  a thing
  aka chandelier, crystals
  scenery
  in the Entrance Hall

  An ornate chandelier with dozens of sparkling crystals.

create the brass key
  a thing
  aka key
  in the Entrance Hall

  A small brass key with an intricate pattern etched into its handle.

## ===========================================================================
## THE LIBRARY AND THE STUDY
## ===========================================================================

create the bookshelves
  a thing
  aka shelves, books, volumes, bookshelf
  scenery, plural
  in the Library

  Rows upon rows of old books. Most are too faded to read.

create the reading desk
  a supporter
  aka desk
  scenery
  in the Library

  A sturdy oak desk with a green leather writing surface.

create the dusty journal
  a thing
  aka journal, book, pages
  openable, readable
  on the reading desk
  states: shelved, consulted

  A leather-bound journal. The pages are yellowed with age.

  after the player opening
    change the dusty journal to consulted when the dusty journal is shelved
    award journal-read
    phrase journal-text
  end after

  on the player reading
    change the dusty journal to consulted when the dusty journal is shelved
    award journal-read
    phrase journal-text
  end on

create the wooden cabinet
  a container
  aka cabinet, walnut cabinet, lock
  scenery, openable, lockable with the brass key
  starts locked
  in the Study

  A tall cabinet made of dark walnut. It has a small brass lock.

create the silver locket
  a thing
  aka locket, chain
  in the wooden cabinet
  states: warm, glowing

  A delicate silver locket on a fine chain. It feels warm to the touch.

  after the player taking, once
    change the silver locket to glowing
    award locket-taken
    phrase locket-glow
  end after

## ===========================================================================
## THE KITCHEN
## ===========================================================================

create the stone hearth
  a thing
  aka hearth, logs
  scenery
  in the Kitchen

  A large hearth, cold now, with a few charred logs inside.

create the wooden table
  a supporter
  aka table
  scenery
  in the Kitchen

  A rough-hewn table scarred by years of use.

create the loaf of bread
  a thing
  aka loaf, bread
  edible
  on the wooden table

  A somewhat stale loaf of bread. Still edible, probably.

create the ceramic mug
  aka mug, cup
  a container
  on the wooden table

  A plain ceramic mug. It's empty.

## ===========================================================================
## THE GARDEN AND THE POND
## ===========================================================================

create the stone fountain
  a thing
  aka fountain
  scenery
  in the Garden

  An old fountain carved with fish and waves. No water flows here anymore.

create the ivy
  a thing
  aka vines, wildflowers, walls
  scenery
  in the Garden

  Thick green ivy covers much of the garden walls.

create the rusty coin
  a thing
  aka coin
  in the Garden
  states: grimy, polished

  An old coin, green with age. Some kind of face is stamped on one side.

  after the player taking, once
    change the rusty coin to polished
    award coin-taken
    phrase coin-weight
  end after

create the reeds
  a thing
  aka reed
  scenery, plural
  in the Pond

  Tall reeds swaying slightly, even though there is no wind.

create the flat stones
  a thing
  aka stone, stones, rock, rocks, loose stone
  scenery, plural, pushable
  in the Pond
  states: settled, shifted

  Smooth, flat stones line the edge of the pond. One of them looks loose.

  on the player pushing
    refuse when the flat stones is shifted: ring-already
  end on

  after the player pushing
    change the flat stones to shifted
    change the golden ring to found
    move the golden ring to the Pond
    award ring-found
    phrase ring-found
  end after

create the golden ring
  a thing
  aka ring, gold ring, band
  states: buried, found

  A simple gold band that gleams even in dim light.

## ===========================================================================
## VERB HELP
## ===========================================================================

## Standard `help` grammar that `helping` takes for itself.

remove from action help
  help

define action helping
  grammar
    help
    hint
    hints
  phrase help-text

## Standard `help` grammar that `listing-verbs` takes for itself.

remove from action help
  commands

define action listing-verbs
  grammar
    verbs
    commands
  phrase verbs-text

define action using-alone
  grammar
    use the target
  the target must be visible
  phrase use-hint

define action using-with
  grammar
    use the item on the other
    use the item with the other
  the item must be visible
  the other must be visible
  phrase use-with-hint

## Standard `talking` grammar that `chatting` takes for itself.

remove from action talking
  talk to or with the target
  speak to or with the target
  chat with the target

define action chatting
  grammar
    talk to or with the target
    speak to or with the target
    chat with the target
  the target must be visible
  phrase talk-hint

## ===========================================================================
## SYNONYMS
## ===========================================================================

extend action examining
  grammar
    inspect the target
    study the target
    view the target
    peruse the target

extend action taking
  grammar
    grab the item
    collect the item
    acquire the item
    snag the item
    fetch the item
    obtain the item
    steal the item
    nab the item
    lift the item

extend action attacking
  grammar
    strike the target
    stab the target
    slash the target
    kick the target

extend action looking
  grammar
    peek
    peer
    gaze

extend action opening
  grammar
    pry the target
    force the target

extend action dropping
  grammar
    toss the item

extend action inserting
  grammar
    place the item in the container

extend action pushing
  grammar
    shove the target
    prod the target

extend action pulling
  grammar
    yank the target

extend action eating
  grammar
    consume the item
    devour the item

extend action going
  grammar
    head north
      means direction north
    head south
      means direction south
    head east
      means direction east
    head west
      means direction west
    head up
      means direction up
    head down
      means direction down
    proceed north
      means direction north
    proceed south
      means direction south
    proceed east
      means direction east
    proceed west
      means direction west
    proceed up
      means direction up
    proceed down
      means direction down

## ===========================================================================
## TEXT
## ===========================================================================

define phrases en-US
  journal-text:
    You flip through the journal. Most entries are illegible, but one page
    reads: "The treasure is hidden where water meets stone."
  locket-glow:
    As you pick up the locket, it glows faintly. You feel a sense of
    accomplishment.
  coin-weight:
    You brush off the grime. Despite its age, the coin has a satisfying
    weight.
  ring-found:
    You push aside one of the loose stones and discover a golden ring hidden
    beneath it!
  ring-already:
    You already found what was hidden here.
  use-hint:
    How do you want to use that? Try a specific verb: OPEN, PUSH, PULL, TURN,
    EAT, WEAR, etc.
  use-with-hint:
    Try a specific command, such as UNLOCK it WITH the key, PUT it ON
    something, or GIVE it TO someone.
  talk-hint:
    To talk, try ASK person ABOUT topic or TELL person ABOUT topic.
  victory:
    Congratulations! You have found all the secrets of this place. You win!

define phrase help-text
  This is a text adventure. Type commands in plain English.{br}
  Most puzzles can be solved with simple two-word commands: VERB NOUN.{br}
  Type VERBS for a full list of available commands.{br}
  Type LOOK to see your surroundings. Type INVENTORY (or I) to check what
  you carry.
end phrase

define phrase verbs-text
  Movement:  NORTH (N), SOUTH (S), EAST (E), WEST (W), UP (U), DOWN (D){br}
  Looking:   LOOK (L), EXAMINE (X) thing, SEARCH thing, LOOK IN/UNDER thing{br}
  Taking:    TAKE thing, DROP thing, PUT thing IN/ON thing{br}
  Using:     OPEN, CLOSE, LOCK/UNLOCK thing WITH key, PUSH, PULL, TURN ON/OFF{br}
  Self:      INVENTORY (I), WAIT (Z), WEAR thing, EAT thing{br}
  Meta:      SAVE, RESTORE, UNDO, SCORE, HELP, VERBS, RESTART, QUIT
end phrase

before the game starts
  change the player to the adventurer
end before
