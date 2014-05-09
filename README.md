# costanzabot

Bot generated from a markov chain of everything George Costanza says in Seinfeld.

## How this particular sausage was made

This was mostly just an excuse to play with [twitter_ebooks](https://github.com/mispy/twitter_ebooks).

First I started with [seinfeld-scripts](https://github.com/colinpollock/seinfeld-scripts).

Next, patch it with this [fix](https://github.com/cschep/seinfeld-scripts/blob/d34dd1deac1b71c760f59bf810494b51e5b87042/download.sh).

```
mkdir scripts
./download.sh scripts
```

Edit `scripts/01.shtml` and change `pc: 101, season 1, episode 1 (Pilot)<br>` to `pc: 101, season 1, episode 0 (Pilot)<br>`.

```
./run.sh
```

This will create an sqlite database called `seinfeld.db`.

Extract everything that George says into a text file:

```
sqlite3 seinfeld.db "SELECT sentence.utterance_id, sentence.text from sentence, utterance WHERE utterance.speaker = 'GEORGE' AND sentence.utterance_id = utterance.id;" > export.txt
```

Move export.txt to the `seed` directory of this repo.

Join the utterances into single lines of text with the parsing script:

`./parse.rb > costanza.txt`

Create a skeleton for the bot.

`ebooks new costanzabot`

Move `costanza.txt` into the `corpus` directory.

```
ebooks consume corpus/costanza.txt
```