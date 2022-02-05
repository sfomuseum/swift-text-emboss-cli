# text-cli

Command line tool for extracting text from images using Apple's Vision framework.

_`text-cli` is kind of a dumb name but I didn't actually think I would finish this on the first go. This tool (and package) will probably be renamed._

## Example

Both of the images in these examples are included in the [fixtures](fixtures) directory.

```
$> swift build

$> ./.build/debug/text-cli ./fixtures/sfomuseum-pin-2019.081.021.jpg 
SANDY HERRMANN

$> ./.build/debug/text-cli ./fixtures/sfomuseum-menu-2000.058.1457.jpg 
GUAM
WAKE -GUAM
LUNCHEON
Entrées
Cold Luncheon Buffet of Lobster Bellevue, Beef Wellington and Smoked Breast of Turkey
Salad a la Russe or Waldorf Salad
A Selection of Luncheon Breads
Desserts
Fruit Flavored Ice Cream Served with Gaufrettes
proute Guam. Captain Musick radioed from the flight deck,
Assorted Fresh Fruit and French Pastries
Everything was functioning perfectly and the China Clipper
settled down to the long .500-r drive ahead. The cloud
International Coffee
moisture on the wings flashed every color of the spectrum and
Café Parisienne
Café Royale
Irish Coffee
the propellers described great glistening arcs as we sped ahead
with Grand Marier
Collee and Cognac
with Baileys Irish Cream
a world al to ourselves - except for the nine radio stations and the three
radio compass stations that kept their invisible fingers on us.
Italian Coffee
Café Mexicano
with Amaretto di Saronno
The China Clipper crossed the International Date Line and arrived in
Coffee and Kahlua
Guam 45 minutes ahead of schedule. After a day of rest and Thanksgiving
Cappuccino
dinner at the Governor's Palace, the crew of the China Clipper was ready
with Chocola
to embark on the final leg of their journey.
/ Cognac
```

## See also

* https://developer.apple.com/documentation/vision
* https://collection.sfomuseum.org/objects/1762939445/
* https://collection.sfomuseum.org/objects/1511924565/#1729566967