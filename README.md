# Sample (Sharpee)

A practice game for learning Chord: rooms, objects, and interactions.

Play it on IF Hub: https://johnesco.github.io/ifhub/app.html?game=sample-sharpee

Written in [Chord](https://sharpee.net/chord/) for the [Sharpee](https://sharpee.net) engine. The whole game is `sample-sharpee.story`. It is a line-for-line translation of the Inform 7 "Sample" on the hub, so the two engines can be compared on identical content: six rooms, four discoveries worth ten points, three ranks, a help system, and a table of verb synonyms.

## Building

This game is built and published from the Sharpee workspace, which holds the shared tooling:

```
npx sharpee play                                   # play in the terminal
npx sharpee test                                   # replay sample-sharpee.tests/
python ../tools/build.py sample-sharpee --force    # gates, build, tests, lay out the hub folder
python C:/code/ifhub/tools/ship.py sample-sharpee  # publish and list on IF Hub
```

## Walkthrough

take brass key, n, open journal, s, s, take rusty coin, s, push flat stones,
take golden ring, n, n, n, up, unlock cabinet with brass key, open cabinet,
take silver locket.
