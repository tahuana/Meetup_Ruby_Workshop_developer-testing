Gilded Rose Kata Refactoring Workshop
=====================================

This repo contains an exercise for our refactoring workshop. A big debt of gratitude is due to Alistair McKinnell for presenting the Gilded Rose Kata and his characterization tests at the last Toronto Ruby Brigade session. We knew immediately that his work would provide an excellent basis for refactoring, and this drove us to (finally!) actually organize it.

Alistair's repo (which we've forked here) was built to demonstrate "three advanced developer testing techniques as they apply to the [Gilded Rose Kata](http://craftsmanship.sv.cmu.edu/exercises/gilded-rose-kata)."  You can learn more about those techniques in the parent repository. Briefly, they are:
1. Characterization testing
  With legacy code without proper specifications or tests, the only thing the developer has to work with is the existing code and its actual behavior: not what the code is supposed to do, but what it actually does.
2. Mutation testing
  With existing tests, mutate (change) certain statements in the source code and check if the test cases are able to detect the errors.
3. Approval testing
  Taking a snapshot (golden master) of an object and comparing all future versions of the object to the golden master.

We've restructured this repository to provide a quick-start introduction to refactoring techniques by replacing Alistair's  refactored Gilded Rose Kata code with the original kruft (translated into Ruby by @professor - check it out here: https://github.com/professor/GildedRose), but retaining the awesome characterization tests Alistair built.

With the old code and characterization test, we're ready to take on the job of refactoring. On Ruby Hack Night, we suggest you focus on the following goals in this order:

1. refactor the solution so it is easier for you and your peer developers to understand,
2. achieve the primary goal of implementing "conjured" items, and
3. achieve any or all of the stretch goals, if you found the above a bit too easy.

Your mission is the same as in the original Gilded Rose Kata.  Have fun and watch out for the goblin!


##Setup

Here are the steps to get you started with the repo. We assume, naturally, that you have a working development machine with Ruby 2.x or better on it. At Ryatta Group we use rbenv, and so we've included some optional elements - just skip them if you're using rvm or are not versioning your Ruby.

###Option 1 (recommended)
1. Fork the repo on this page: https://github.com/k00ka/developer-testing
2. Move to your projects area.
3. Clone the forked repo.

###Option 2 (beginners)
1. Move to your projects area:
``sh
% cd ~/projects # or whatever you called it...
``
2. Clone the repo using the following:
``sh
% git clone git@github.com:k00ka/developer-testing.git
``

###Both options continue...
``sh
% cd developer-testing
% gem install bundler
% bundle
``
######Note: if you use rbenv...
``sh
% rbenv rehash
``

##Run the characterization test 
``sh
% rspec ./spec/gilded_rose_characterization_spec.rb
.

Finished in 0.00169 seconds
1 example, 0 failures
``

##Run approvals
``sh
% approvals verify
``


## Rules and Specification
Hello and welcome to team *Gilded Rose*.

As you know, we are a small inn with a prime location in a prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date.

We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items.

First an introduction to our system:

* All items have a SellIn value which denotes the number of days we have to sell the item

* All items have a Quality value which denotes how valuable the item is

* At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

* Once the sell by date has passed, Quality degrades twice as fast

* The Quality of an item is never negative

* "Aged Brie" actually increases in Quality the older it gets

* The Quality of an item is never more than 50

* "Sulfuras", being a legendary item, never has to be sold or decreases in Quality

* "Backstage passes", like aged brie, increases in Quality as it's SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover for you).

* Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a legendary item and as such its Quality is 80 and it never alters.

Source: http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/

Stretch goals If you want to make things a little more interesting, try ensuring that if the following items are added to the Gilded Rose, they behave properly:

* "Aged Stilton", which should act like aged brie.

* "Aged Elvish Wine", which should act like aged brie.

* "Backstage passes to the Rat Queens", which should act like any other kind of backstage pass.

* "Backstage passes to the Hard Rock Troll Orchestra", which should act like any other kind of backstage pass.

* "Conjured loincloth", which should act like any other conjured item.

* "Conjured fake beard", which should act like any other conjured item.
