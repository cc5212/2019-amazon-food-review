# 2019-amazon-food-review

## Who we are

[Joaquín Cruz](https://github.com/joacocruz6)
[Diego Ortego](https://github.com/Gedoix)
[Valeria Valdés](https://github.com/valeriavaldes)

## Our Goal

Our project's original goal was to look into which Amazon Foods were best and worst by looking at their reviews on the site, and to have a good time looking at some strange and interesting reviews.

We started our analysis with dissapointment, the fact that the dataset doesn't include the food's name, but only an identifier (and we couldn't find another dataset we could join with for that information).

But then, as we looked at the data we found an amazing new world of possibilities. There indeed seem to be all sorts of people using amazon reviews, and some of their reviews are hilarious.

Some interesting questions are what is the user with the greatest amount of one star reviews, with the greatest amount of five star reviews, which are the most and less usefull reviews, and what is their content, the lowest avarage score, the user with the morst reviews written.

## Our Dataset

We will be using an amazon dataset, taken from kaggle.

[Dataset](https://www.kaggle.com/snap/amazon-fine-food-reviews)

It contains reviews for food items delivered through amazon's delivery system.

We chose this dataset mostly because everyone enjoys food, it's a universal human meme, and having the readers/audience relate to your data is pretty nice. Also because we love food ourselves.

The data comes in `csv` format, and has columns for identifying the user, the food they rated, the rating, a summary of their review, how useful the review enden up bein for other users, and a piece of text of their own making.

The data's schema is:

* RowId: Offset of the dataset.
* ProductId: Unique identifier for the product
* UserId: Unique identifier of the user
* ProfileName: Profile name of the user
* HelpfulnessNumerator: Number of users who found the review helpful
* HelpfulnessDenominator: Number of users who indicated whether they found the review helpful or not
* score: rating between 1 and 5
* Time: Timestamp for the review
* Summary: Brief summary of the review
* Text: Text of the review

The entire dataset is `287 MB` big, with 568.454 tuples total.

## Methods

We used Apache Pig for analysing our data.

The dataset was uploaded to the HDFS file system in the course's cluster server.

We chose this tool because we valued the ability to prototype queries fast, over the unknown dataset, using in a friendly language, over efficiency of said requests.

In this sense, the `grunt` shell allowed us to prototype fast, and see how our results would look in general before actually computing them, thanks to pig's `DESCRIBE` operator and lazy computaton.

Since the data contains a product_id column, but no actual name for the product being reviewed, we tried to search for a dataset with which to join our data for this. Sadly we only found small datasets with less than 100 distinct named product_ids in our search.

Despithe this, we believe scraping amazon's pages for the names of each product_id is an option for extending the results we got that could be explored in the future.

We mostly used grouping and aggregating numeric values for computing our results (toguether with some arithmetic functions when computing, say, standard deviations).

## Results



## Conclusion



## Some results of our queries (Appendix)

### Users with the most one star scores

(christopher hayes,199)
(BreezyPaige,67)
(Bigmac,47)
(Joe MacBu,43)
(Ryan Johnson,42)

### Users with the most five star scores

(Rebecca of Amazon "The Rebecca Review",326)
(Gary Peterson,286)
(C. F. Hill "CFH",271)
(O. Brown "Ms. O. Khannah-Brown",240)
(Gunner,182)

### Lesast useful reviews

(-2,My son loves spaghetti so I didn't hesitate ordering this for him. He says they are great. I have tried them myself and they are delicious. Just open and pop them in the microwave. It is very easy. The best thing about ordering from Amazon grocery is that they deliver to your door. If you have a loved one that lives far away and may have limited transportation this is the answer. Just order what you want them to have and Amazon takes care of the rest.)
(-1,It was almost a 'love at first bite' - the perfectly roasted almond with a nice thin layer of pure flavorful cocoa on the top. You can smell the cocoa as soon as you open the canister - making you want to take a bite. You may or may not like the taste of this cocoa roasted almonds depending on your likingness for cocoa.  We are so much used to the taste of chocolate (which is actually cocoa + many other ingredients like milk ...) - that you might have never really tasted really cocoa. Tasting this item it like tasting and enjoying flavorful pure raw cocoa with crunchy almonds in the center.  Get yourself a box and see for yourself what real cocoa + almonds is ! Where this product loses a star is in its packaging - the external sleeve is kind of comes in one piece, so if you try to remove the lid, the external sleeve kind of tends to come off fully - so careful when you are removing the external sleeve for the canister.)

### People wih the worst average score (Food haters)

(1.0, Frank Biddinger)
(1.0, kw2thr)
(1.0, Cindy)

### Most useful review

(866, I was lamenting about only having frech lettuce, herbs, chives, and tomatoes from may garden during the long fall-winter-spring parts of the year. The refrigerated stuff from the grocery store goes bad right away and does not taste as good as the fresh stuff from the garden, either. Then I saw a Time Magazine page on the new AeroGrow AeroGarden, and I just had to try it out. After reading the AeroGrow website before making the purchase, I realized that buying one garden would not work for me, as the tomatoes cannot be grown in the same garden as lettuce & herbs. This is partially due to the large amount of room taken up by the tomatoes, and also because the lamp/watering cycle is different and finally because the nutrients are different. So, I bought two gardens, along with the Salad Greens seed kit and Cherry Tomato seed kit. Each garden comes with a mixed herb kit, so I figured to mix in a few herbs with the other seeds, and if they did not work, no big loss. The products came quickly and the instructions for assembly were very clear and well written with excellent diagrams. I came to realize that this somewhat pricey product at least comes from a company that produces a classy product (a rare thing these days). I found a space on a shelf beside the basement stairs, and placed both assembled gardens there. I also bought and placed a digital thermometer with maximum/minimum temperature memory readouts ($10 at Radio Shack), because I was unsure of what temperature extremes the plants might experience in that location (68-72 as it turns out). The seed kits contain pre-seeded planting pods. Each pod is basically a plastic cup shaped frame with two pieces of foam rubber inside the cup part, like two slices of bread with the seeds sandwiched between them. They simply insert into the seven holes in the top of the garden's water tank. The Salad Greens and Herbs come with seven pods per kit, while the Tomatos come with three pods plus four hole plugs-the plants are bigger so three of them take up thw whole space available. The hole plugs prevent evaporation of the water through the unoccupied holes. The water tank holds exactly one gallon of regular drinking water. Well water is not recommended, presumably because of impurities, and since I am on a well I bought two one-gallon plastic jugs of 'drinking water' at the store for 50 cents each and filled the tanks with their contents. A pump in the tank takes water and pipes it to the rim of each of the seven holes in the tank's top, and here the trickle of water flows into the foam sandwich of each seed pod. The foam stays moist and the rest of the water drips back down into the tank. The garden's 'computer' cycles the water flow on and off according to the amount recommended for the type of plant being grown. A water level sensor turns on a flashing red light when it is time to add more water to the tank.<br /><br />The top of the garden is a reflector with two compact-fluorescent lamps, of the variety that has the special ultraviolet (UV) coating that causes the emmitted light to resemble sunlight. The reflector rides on a vertical pole that extends up from the garden's base, so you can raise and lower the lamps as required to keep them the correct distance above the plants. The garden's 'computer' also turns the lamps on and off according to a schedule tailored to the type of plant. If using the gardens in a place where the light might be a problem at night, you can syncronize the computer so that the lights are on only during the daytime and off when you are trying to sleep.<br /><br />The seed kits come with little clear plastic cups that cover each pod until the seeds have germinated, then you can dispose of them. The kits also come with a bag of nutrient tablets, which you add to the water tank when the computer prompts you to by flashing a red light. The nutrients are tailored to the type of plant being grown, and there are enough of them to feed the plants during their anticipated life span.<br /><br />I planted one garden with five salad green (leaf lettuce) pods, plus one pod each from the Herb kit, chives and parsley. The other garden got the threee pods from the Cherry Tomato kit; two reds and one yellow variety.<br /><br />Each seed pod has a label that tells you how many days to wait for plants to appear after germination. All of my plants appeared like clockwork.<br /><br />I have had the gardens for about six weeks now, and have been enjoying salads containing lettuce, parsley and chives plus other odds and ends from the fridge, for the last two or three weeks. The lettuce and herbs are all beautiful, with no problems from bugs or too much/too little water, excessive temperatures, etc. No need to wash the plants or check for bugs or pick off bad spots, everything goes straight to the salad bowl. What a joy! Even with only five lettuce plants, I have to eat two meals including salad each day to keep up with the growth. This would easily feed two people, and if all seven salad green pods had been used, three people.<br /><br />The tomatoes are all doing well ahnd have been pruned according to instructions. It will be some time yet before they produce flowers, and then fruit. But based on the health of the plants, I expect a good yield.<br /><br />Each seed kit comes with a full color manual/booklet that covers all aspects of 'planting', germinating, feeding, pruning (if required) and then harvesting the plants. There are also photos of plants where things have gone wrong (leaves burned because the lamps were not raised up as the plants grew taller, etc) with clear instructions on how to recognize problems and correct them. Harvesting instructions clearly tell how much can be taken at a time without killing the plant, and so on.<br /><br />The AeroGrow gardens are a well designed, well built product with excellent documentation. All my visitors are amazed at how well the product works, and many have gone out and bought their own. I anticipate years of improved eating because of this product.<br /><br />*****************<br /><br />Update November 2007<br /><br />I used my two gardens all Winter (2006/2007) until it was time to start getting produce from my real (outdoor) garden in the Summer, at which time I put the little gardens to rest for the season. During their use, I got a large crop of cherry tomatoes, all of which were beautiful. I went through on crop of lettuce and salad greens, and when the lettuce finally bolted, I replanted with only lettuce (no chives, etc this time) and got another couple of months worth of lettuce. I have now fired them up again in the Fall, and have nice little plants popping up. Aerogrow has more seed options available now, so I have planted a more interesting kind of lettuce.)

### The product with the most five star reviews

(B007JFMH8M, 624)

### The user who wrote the most reviews

(however,1118)

### A user with a similar name to Aidan

(Hogan,1,As others have said, it has the chemical taste of artificial sweetener. When will these companies realize that there are a ton of consumers out there who do NOT like sugar substitutes!)

### Christopher Hayes's reviews

(A3TVZM3ZIXG8YW,christopher hayes,1,This review will make me sound really stupid, but whatever. I don't really care as long as people find out what's real and can avoid my mistakes.<br /><br />I got my wonderful little sweet Bella Bean when she was a few days shy of three years old. She had been bounced around from house to house and eating whatever was cheap. I have had cats around me my entire life, for about twenty-five years now. My mother always just fed them whatever, the kinds of food you buy in the supermarket - Friskies, Nine Lives, Kit & Kaboodle, stuff like that. And our cats were always fine, at least in terms of their eating habits. They would eat in the morning, stop when they were done, come back, and eat some more when they got hungry.<br /><br />My housemate at the time was working for Hill's and assured me that this was the best food ever made, so great, so on and so forth. I now know that she is an utter buffoon, but I initially trusted her judgment, which is so unfortunate because she doesn't think. She also had plenty of coupons for free or deeply discounted bags, which made it a much more attractive choice.<br /><br />I first tried feeding the little Bean an unmeasured amount of Science Diet in a bowl, but that didn't work, as she would devour it in one sitting. So then I took to measuring it, and she did the same thing. Then I started parsing it out to twice a day. That didn't work either, because she would start going crazy in the middle of the day, running around, intentionally destroying things, deliberately spilling her water, crying, etc., until she got more food. So then I split it into three servings. Same thing. Then it got to be four servings. That was a little better, but it was too much maintenance and unrealistic to be around every day to feed her four times. So then it went back to three. All the while, I was trying to reduce the amount of food I was feeding her to less than 3/4 of a cup because she was a little chubby. Reducing was hell. She became even more hungry, but I figured she would get used to it. Not really.<br /><br />For over a year, she would wake me up every morning looking for food in a serious way, knocking things off my desk, ripping up any paper she could find, scratching at the door and committing general acts of mischief. As soon as she got food, she was back to her sweet self, but only for three or four hours.<br /><br />We thought she was bored, we thought she was a little nutty, and maybe even had a kitty eating disorder. She always wanted food. It was kind of funny but in the end it was just sad.<br /><br />A few weeks back, we took her to a new (good, non-money factory) vet for her second checkup since I've had her. I talked with him about her being always hungry. He asked what she ate, and I told him the adult indoor Science Diet. Without saying as much, he basically told me that this food is garbage and I should look for something else. He said cat food should have a protein followed by a carbohydrate as the first two ingredients. Science Diet does, in a very loose, by-product kind of way - ground up slaughterhouse leftovers and corn dust. Then they put a bunch of vitamins in it to make it "healthy," instead of just using good ingredients from the beginning. Not that I care about spending money on the Bean, but this food is way too expensive for what it is.<br /><br />So we began transitioning her onto Wellness indoor formula about two weeks ago. She is still eating 50 percent Science Diet with 50 percent Wellness (you really shouldn't just give a cat different food one day out of the blue) but SHE NEVER FREAKS OUT ANYMORE. It's amazing. And it's 100 percent because she is eating real food now, along with that sawdust and chicken hearts I still regrettable have to feed her. We have her down to eating twice a day, only 1/3 cup in TOTAL. She was eating three times a day, 5/8 of a cup in total. Now she eats some in the morning, walks away, eats some more a few hours later, and then looks for dinner about twelve hours after her initial feeding. No more knocking things over, no more trashing Dad's papers on the desk, no more howling, no more deliberately spilled water on the floor. It's incredible.<br /><br />I feel so bad that I was doing this to her for so long. We really thought she was just being dramatic or whatever. But no, she was genuinely hungry because she wasn't eating any real food.<br /><br />Do your cat a favor - buy her or him so food made with real ingredients, things you would eat - Wellness, Halo, Innova, Evo, whatever. Figure it out for yourself, but please don't feed your cat this. It's garbage.)
Esto por 199

### Bigmac's reviews

(AMQ1MEG334SAP,Bigmac,1,My dog seems to be allergic to poultry so we thought we would switch him to this lamb-based formula.  Usually he is a good eater, but my dog had one smell of this stuff and wouldn't come back.  I understand Wellness puts higher-end ingredients in their food but if a dog doesn't like it there goes your money right down the drain.)
(AMQ1MEG334SAP,Bigmac,1,Whole-wheat pasta is better for you.  However, this brand, Davinci is an absolute ripoff.  It is about $3 per box for only 12 oz.  To give a perspective, one could buy 16oz boxes of whole-wheat spaghetti for $1 per box and it will taste just as good.<br /><br />One would think that the pasta is organic at this staggering price, but no it is just regular whole-wheat pasta in a small 12oz. box.  This is definitely a case of not getting what you pay for!)
(AMQ1MEG334SAP,Bigmac,1,The package says buffalo and venison, yet on the ingredients buffalo is number one, then chicken, then lamb.  Venison is way down on the list now.  Apparently, Taste of the Wild is owned by Diamond Pet Foods.  Yes the same Diamond Pet Foods that had their food recalled, where they were using a toxic chemical.  If you lookup Diamond Pet Foods on Amazon you will see that they use lower quality ingredients and none of their foods are in the same league as Wellness or Blue Buffalo.<br /><br />My problem with this food is that they used to use buffalo and venison as the top 2 ingredients, as the label indicates, but now they use chicken and lamb to cheapen the product.  Buyer Beware!)
(AMQ1MEG334SAP,Bigmac,1,We were happy with the gift baskets that were delivered. However the company only has one distribution center in California, which is obviously not efficient to deliver to the East Coast.<br /><br />Despite the company's ambitions to become a national company, they are not willing to pony up the money to get additional distribution facilities outside of California.<br /><br />This maybe great if you live in California. However I live in Florida and I ordered on December 22 and my basket did not arrive until January 4th. I think that would be unacceptable in anyone's view, espescially since giving a gift basket can be time-sensitive.<br /><br />Until this company gets with the program and gets other distribution facilities I would stay away unless you want to wait two weeks for a simple basket to be delivered.)
(AMQ1MEG334SAP,Bigmac,1,I bought this thing after a recommendation from a pet store rep. My dog hardly touched the stuff, and then I looked at the ingredients: one of the first things on it was corn-a grain known to cause allergies in dogs. As a matter of fact, corn might be the most allergy-prone food amongst dogs. Not to mention, thanks to our friends at Monsanto, it is almost always Genetically modified (GMO) or a franken-food, unless it's organic. Real "premium" dog foods brag that they've no corn.<br /><br />Right at the top of the list of ingredients is chicken-by-products, another no-no among real "premium" dog foods. This means all the waste that it is usually thrown out from the chicken since it's not real meat. Cheap dog foods put this in their food simply because it's cheap, but it's not real meat. A little further down you will notice BHA, an artificial preservative, which again real "premium" dog foods do not have.<br /><br />In short, BilJac is a joke. It is basically, insanely overpriced Alpo, with no organic ingredients whatsoever, and uses all the shortcuts, filler, and chemistry that the cheapest dog foods on the market use. Don't be fooled by the old-fashioned appeal of the company's 60 years in business. There is nothing but modern chemistry in the bag, and all the folksy appeal will not make up for cheap, lousy ingredients. I ended up buying Blue Buffalo Wilderness and I have not looked back.)
