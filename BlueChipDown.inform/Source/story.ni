"BlueChipDown" by Jonathan Nakagawa

When play begins: say "'Hurry up! I thought I asked you for those copies five minutes ago and this coffee is cold get me another.' You have had this job for less than two days and already contimplated 'acidently' pushing your Boss out a window 12 times. 'Hell, Michael was a better assitant than you are and he couldn't tell the differance between a pen and pencil.' Your jaw begins to ache from holding tightly clenched shut to contain the fowl stream of profanity that you would otherwise end up hurrling at your boss. Standing up from the file you've been sorting you turn to your boss and manage to say, 'Alright I'm going to make copies and get your coffee i'll be back soon.' His face turns and even darker shade of red as he shouts, 'No! You stay here I don't want to have to wait another hour for my coffee.'"

[Code to display a players location in the game and possible exits in the header.]
When play begins:
now left hand status line is "Exits: [exit list]";
now right hand status line is "[location]".

To say exit list:
	let place be location;
	repeat with way running through directions:
		let place be the room way from the location;
		if place is a room, say "[way]".
[Taken from A Day For Spelling by Mary Kiang]

Talking to is an action applying to one visible thing.
Understand "talk to [someone]" or “converse with
[someone]” as talking to.
Check talking to: say "[The noun] doesn't reply."
[taken from http://www.musicwords.net/if/InformHandbook.pdf chapter 5]

[Global:] GameState is a number that varies. GameState is 0.

[Global:] Converser is a number that varies. Converser is 0.

[Global:] Failure is a number that varies. Failure is 0.

[taken from http://www.musicwords.net/if/InformHandbook.pdf chapter 9]

instead of going south from Boss's Cubical:
	if gamestate is 0:
		say "You can't leave yet you need to first see what's up with the computer.";
	otherwise:
		move the player to Floor One Hallway;
		
Every turn:
	if Gamestate is 0:
		if Money is 37000:
			increase Gamestate by 1;
			say "The computer stops its insistant bleeping. Thank hevans that you managed to sell everything before they tanked any more.";
	

Every turn:
	if failure is 1:
		end the story finally saying "You are fired.";
	
The description of player is "[if GameState is 0] After getting out of college strapped to cripling debt you couldn't afford much more than a couple second hand dress shirts and an imitation watch."

Boss's Cubical is a room. "[if GameState is 0] Perhaps this room, if it can even be called a room, is the reason your Boss is constantly angry. Barely large enough for you to take a step in any direction everything is within easy arms reach. Not that there is much here an old computer sitting on a desk, a filling cabinet, and corded phone. The computer is insistantly beeping. [otherwise] Perhaps this room, if it can even be called a room, is the reason your Boss is constantly angry. Barely large enough for you to take a step in any direction everything is within easy arms reach. Not that there is much here an old computer sitting on a desk, a filling cabinet, and corded phone."

Boss is a man in Boss's Cubical.  "From day to day your Boss never seem change his appearence. He must own at least a dozen of the same set of plain clothes. Whenever he sees you his face turns a deep beetroot red and he seems to inflate."

Old Computer is scenery. It is in Boss's Cubical.

[Global:] Money is a number that varies. Money is 0.

Understand "sell [something] [number]" as selling. Selling is an action applying to one thing and one number.

orange stock is a thing carried by the player.The printed name is "Orange stock x [orangeshare-count]". orange stock has a number called orangeshare-count. orange stock has a number called orange-price. The orange-price of the orange stock is usually 200. The orangeshare-count of the orange stock is usually 100. The description of Orange stock is "Stock that you own that you can sell any number of. Type 'sell orange stock' followed by the number you want to sell or 'puchase orange stock' followed by the number you want to buy. You currently have [orangeshare-count] Orange stock."

backward stock is a thing carried by the player.The printed name is "backward stock x [backwardshare-count]". backward stock has a number called backwardshare-count. backward stock has a number called backward-price. The backward-price of the backward stock is usually 150. The backwardshare-count of the backward stock is usually 100. The description of backward stock is "Stock that you own that you can sell any number of. Type 'sell backward stock' followed by the number you want to sell or 'puchase backward stock' followed by the number you want to buy. You currently have [backwardshare-count] backward stock."

redwood stock is a thing carried by the player.The printed name is "Redwood stock x [redwoodshare-count]". redwood stock has a number called redwoodshare-count. redwood stock has a number called redwood-price. The redwood-price of the redwood stock is usually 100. The redwoodshare-count of the redwood stock is usually 20. The description of redwood stock is "Stock that you own that you can sell any number of. Type 'sell redwood stock' followed by the number you want to sell or 'puchase redwood stock' followed by the number you want to buy. You currently have [redwoodshare-count] redwood stock."

Instead of selling:
	if player is in Boss's Cubical:
		if the noun is orange stock:
			decrease the orangeshare-count of the Orange stock by the number understood;
			if the orangeshare-count of the orange stock is less than zero:
				increase the orangeshare-count by the number understood;
				say "You don't have that many stock to sell. You have [orangeshare-count] Orange stock.";
			otherwise:
				let C be the orange-price of the orange stock;
				let A be the number understood;
				let B be C * A;
				increase Money by B;
				say "Now you have [Orangeshare-count] Orange stock and [Money] dollars.";
		Otherwise:
			if the noun is backward stock:
				decrease the backwardshare-count of the backward stock by the number understood;
				if the backwardshare-count of the backward stock is less than zero:
					increase the backwardshare-count by the number understood;
					say "You don't have that many stock to sell. You have [backwardshare-count] backward stock.";
				otherwise:
					let C be the backward-price of the backward stock;
					let A be the number understood;
					let B be C * A;
					increase Money by B;
					say "Now you have [backwardshare-count] backward stock and [Money] dollars.";
			Otherwise:
				if the noun is redwood stock:
					decrease the redwoodshare-count of the redwood stock by the number understood;
					if the redwoodshare-count of the redwood stock is less than zero:
						increase the redwoodshare-count by the number understood;
						say "You don't have that many stock to sell. You have [redwoodshare-count] redwood stock.";
					otherwise:
						let C be the redwood-price of the redwood stock;
						let A be the number understood;
						let B be C * A;
						increase Money by B;
						say "Now you have [redwoodshare-count] redwood stock and [Money] dollars.";
[code for selling stocks created with a great deal of help from Mrs. Kiang]

Understand "purchase [something] [number]" as purchasing. Purchasing is an action applying to one thing and one number.

Instead of Purchasing:
	if player is in Boss's Cubical:
		if the noun is orange stock:
			increase the orangeshare-count of the Orange stock by the number understood;
			let C be the orange-price of the orange stock;
			let A be the number understood;
			let B be C * A;
			decrease Money by B;
			if Money is less than zero:
				increase the orangeshare-count by the number understood;
				say "You don't have enought money.";
			otherwise:
				say "Now you have [orangeshare-count] Orange stock and [Money] dollars.";
		Otherwise:
			if the noun is backward stock:
				increase the backwardshare-count of the backward stock by the number understood;
				let C be the backward-price of the backward stock;
				let A be the number understood;
				let B be C * A;
				decrease Money by B;
				if Money is less than zero:
					increase the backwardshare-count by the number understood;
					say "You don't have enought money.";
				otherwise:
					say "Now you have [backwardshare-count] backward stock and [Money] dollars.";
			Otherwise:
				if the noun is redwood stock:
					increase the redwoodshare-count of the redwood stock by the number understood;
					let C be the redwood-price of the redwood stock;
					let A be the number understood;
					let B be C * A;
					decrease Money by B;
					if Money is less than zero:
						increase the redwoodshare-count by the number understood;
						say "You don't have enought money.";
					otherwise:
						say "Now you have [redwoodshare-count] redwood stock and [Money] dollars.";

[code for buying stocks created with a great deal of help from Mrs. Kiang]

[Global:] Philip'sComputer is a number that varies. Philip'sComputer is 0.

[Global:] OldComputerState is a number that varies. OldComputerState is 0.

[Global:] OrangeStock is a number that varies. OrangeStock is 1000.

[Global:] RedWoodStock is a number that varies. RedWoodStock is 1000.

[Global:] BackwardStock is a number that varies. BackwardStock is 1000.

Instead of examining Old Computer:
	if OldComputerState is 0:
		say "The computer is currently displaying your Boss's stock portofolio. It mainly consists of three stocks Orange, RedWood, and Backward. To your shock and dismay you realize that over the course of the last 10 minutes your Boss's portofolio has lost 10 percent equating to almost 13 million dollars. And the stocks' value are still plumiting. You'll have to act fast to save your clients. You try to remember how you Boss sold stocks. You think that he just typed sell or purchase, the stocks name, and the number of shares to buy or sell.";
	otherwise:
		say "A giant monitor rests upon your Boss's desk humming away.";
	
Instead of examining Orange Stock:
	say "You own [OrangeStock] shares";		

Corded Phone is scenery. It is in Boss's Cubical.

Filling Cabinet is in Boss's Cubical. Filling Cabinet is an openable container. Filling Cabinet is lockable and locked. Cabinet Key unlocks the Filling Cabinet.

Notes is a thing. It is in Filling Cabinet. "You knew your Boss would be to lazy to cover his tracks. Scattered throughout the various files are notes from conversations with the employes of numerous companies talking about products before they had been publicly announced. These are most definitely illegal and more than enough to get your Boss arrested but maybe there won't be a need for that perhaps you should talk to him."

Player carries cabinet key.

Philip's Cubical is a room. It is east of Floor One Hallway.

Philip's Computer is scenery. It is in Philip's Cubical.

Philip's Stocks is scenery. It is in Philip's Cubical. "[if Philip'sComputer is 0] You can't see them because Philip's Computer is currently locked. [otherwise if Philip'sComputer is 1] Philip is currently owns [Philip'sOrangeStock] orange stocks, [Philip'sRedWoodStock] Redwood Stocks, and [Philip'sBackwardStock] Backward."

[Global:] Philip'sOrangeStock is a number that varies. Philip'sOrangeStock is 20000.

[Global:] Philip'sRedWoodStock is a number that varies. Philip'sRedWoodStock is 0.

[Global:] Philip'sBackwardStock is a number that varies. Philip'sBackwardStock is 0.

Stapler is a thing. It is in Philip's Cubical.

Casting Password is an action applying to nothing.
Understand "abcd1234" as casting Password.
Instead of casting Password:
	if player is in Philip's Cubical:
		if Philip'sComputer is 0:
			say "The computer gives a satisfying ding and you are logged in and able to see Philip's Stocks.";
			increase Philip'sComputer by 1;
		Otherwise:
			say "You already logged in."

Yellow Sticky Note is a thing. It is in Philip's Cubical. It is undescribed. The description is "[Line Break]'Pasword:[Line Break] abcd1234'"

Instead of looking under Stapler:
	if player is not carrying Sticky Note:
		say "You find a yellow sticky note a fixed to the bottom of the stapler. It reads, 'Pasword:[Line Break] abcd1234'";
	Otherwise:
		if player is carrying Sticky Note:
			say "You already took the sticky note."

Floor One Hallway is a room. It is south of Boss's Cubical.

Floor One Elevator is a room. It is west of Floor One Hallway.

Andrew's Office is a room. It is south of Floor One Hallway.

Meeting Room is a room.

Ground Floor Button is scenery. It is in Floor One Elevator. "The button has a large embroidered G on it."

Floor One Button is scenery. It is in Floor One Elevator. "The button has a large embroidered 1 on it."

Floor Two Button is scenery. It is in Floor One Elevator. "The button has a large embroidered 2 on it."

[Code for Elevator]

Instead of pushing Ground Floor Button:
	move player to Lobby;
	move Ground Floor Button to Lobby Elevator;
	move Floor One Button to Lobby Elevator;
	move Floor Two  Button to Lobby Elevator;
	say "You disinterestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a bustling lobby.";
	
Instead of pushing Floor One Button:
	move player to Floor One Hallway;
	move Ground Floor Button to Floor One Elevator;
	move Floor One Button to Floor One Elevator;
	move Floor Two  Button to Floor One Elevator;
	say "You disinterestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a endless sea of cubicals.";
	
Instead of pushing Floor Two Button:
	move player to Reception;
	move Ground Floor Button to Floor Two Elevator;
	move Floor One Button to Floor Two Elevator;
	move Floor Two  Button to Floor Two Elevator;
	say "You disinterestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a expansive reception room.";

Lobby is a room. It is west of Lobby Elevator.

Cafe is a room. It is north of Lobby.

Security Office is a room. It is south of Lobby.

Lobby Elevator is a room.

Car is a room. It is west of Lobby.

Driver is a man in Car.

After talking to Driver:
	move player to SEC;
	say "'Where do you want to go sir?' [paragraph break] 'Take me to SEC' [paragraph break] 'Right away sir.'";

Taxi is a room. It is north of SEC.

Taxi Driver is a man in Taxi.

After talking to Taxi Driver:
	move player to lobby;
	say "'Where ya headed?' [paragraph break] 'Take me to company name as fast as you can.' [paragraph break] 'You got it.'";

SEC is a room. 

Floor Two Elevator is a room.

Reception is a room. It is south of Floor Two Elevator.

Board Room is a room. It is east of Reception.

CEO Office is a room. It is west of Reception. 

Floor Three Elevator is a room.

