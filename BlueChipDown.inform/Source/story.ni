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

[Global:] Failure is a number that varies. Failure is 0.

[Global:] Philip'sComputer is a number that varies. Philip'sComputer is 0.

[Global:] OldComputerState is a number that varies. OldComputerState is 0.

[Global:] Money is a number that varies. Money is 0.

[Global:] Philip'sMoney is a number that varies. Philip'sMoney is 0.

[Global:] Boss'sConversation is a number that varies. Boss'sConversation is 0.

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
			say "The computer stops its insistant bleeping. Thank hevans that you managed to sell everything before they tanked any more. A voice booms out from a hidden speaker, 'All employees come directly to the meeting room.' You think you get to the meeting room by going south out of your office, west through the hallway into the elevator, down to the ground floor, and finally south from the lobby.";
	
Every turn:
	if failure is 1:
		end the story finally saying "You are fired.";
	
The description of player is "[if GameState is 0] After getting out of college strapped to cripling debt you couldn't afford much more than a couple second hand dress shirts and an imitation watch."

Boss's Cubical is a room. "[if GameState is 0] Perhaps this room, if it can even be called a room, is the reason your Boss is constantly angry. Barely large enough for you to take a step in any direction everything is within easy arms reach. Not that there is much here an old computer sitting on a desk, a filling cabinet, and corded phone. The computer is insistantly beeping. [otherwise] Perhaps this room, if it can even be called a room, is the reason your Boss is constantly angry. Barely large enough for you to take a step in any direction everything is within easy arms reach. Not that there is much here an old computer sitting on a desk, a filling cabinet, and corded phone."

Boss is a man in Boss's Cubical.  "From day to day your Boss never seem change his appearence. He must own at least a dozen of the same set of plain clothes. Whenever he sees you his face turns a deep beetroot red and he seems to inflate." 

Instead of talking to Boss:
	say "You could say: [if Boss'sConversation is 1][Line break][bracket]1[close bracket]'Could I have the key for the cabinet?'[Line break][otherwise if Boss'sConversation is 2][bracket]2[close bracket]'Because I said so and thats the only reason you should need!'[Line break][bracket]3[close bracket]'I'm going to write one final report on how you saved your client's funds.'[Line break][otherwise if player carries Notes][Bracket]4[Close Bracket]'Hey, Boss look at this!'";
	
Casting Ask For Key is an action applying to nothing.
Understand "1" as casting Ask For Key.
Instead of casting Ask For Key:
	If player is in Boss's Cubical:
		if Boss'sConversation is 1:
			say "'Could I have the key for the cabinet?' you ask. 'Why should I give that?' your Boss responds.";
			increase Boss'sConversation by 1;
			
Casting Be Rude is an action applying to nothing.
Understand "2" as casting Be Rude.
Instead of casting Be Rude:
	If player is in Boss's Cubical:
		if Boss'sConversation is 2:
			say "'Because I said so and thats the only reason you should need!' you say. 'Get out' your Boss screams.";
			Increase failure by 1;
			
Casting Be Polite is an action applying to nothing.
Understand "3" as casting Be Polite.
Instead of casting Be Polite:
	If player is in Boss's Cubical:
		if Boss'sConversation is 1:
			say "'I'm going to write one final report on how you saved your client's funds.' you say. 'Well... Alright.' he responds handing you the key.";
			Increase Boss'sConversation by 1;
			Move Cabinet Key to player;
			
Casting Take Over is an action applying to nothing.
Understand "4" as casting Take Over.
Instead of casting Take Over:
	If player is in Boss's Cubical:
		if Boss'sConversation is 2:
			if player carries Note:
				say "'Hey, Boss look at this!' you say gesturing with the notes. 'Give those to me!' he shouts. 'No. I'm not taking any more orders from you. Things go my way now. So this is what's going to happen. You are going to go to Jonathan and say that for personal reasons you have to resign and suggest me as a replacement.' 'Never.' he spits. 'I could always go to the cops' you respond. 'Fine.'";
				Increase Boss'sConversation by 1;

Old Computer is scenery. It is in Boss's Cubical.

Understand "sell [something] [number]" as selling. Selling is an action applying to one thing and one number.

orange stock is a thing carried by the player.The printed name is "Orange stock x [orangeshare-count]". orange stock has a number called orangeshare-count. orange stock has a number called orange-price. The orange-price of the orange stock is usually 200. The orangeshare-count of the orange stock is usually 100. The description of Orange stock is "Stock that you own that you can sell any number of. Type 'sell orange stock' followed by the number you want to sell or 'puchase orange stock' followed by the number you want to buy. You currently have [orangeshare-count] Orange stock."

backward stock is a thing carried by the player.The printed name is "backward stock x [backwardshare-count]". backward stock has a number called backwardshare-count. backward stock has a number called backward-price. The backward-price of the backward stock is usually 150. The backwardshare-count of the backward stock is usually 100. The description of backward stock is "Stock that you own that you can sell any number of. Type 'sell backward stock' followed by the number you want to sell or 'puchase backward stock' followed by the number you want to buy. You currently have [backwardshare-count] backward stock."

redwood stock is a thing carried by the player.The printed name is "Redwood stock x [redwoodshare-count]". redwood stock has a number called redwoodshare-count. redwood stock has a number called redwood-price. The redwood-price of the redwood stock is usually 100. The redwoodshare-count of the redwood stock is usually 20. The description of redwood stock is "Stock that you own that you can sell any number of. Type 'sell redwood stock' followed by the number you want to sell or 'puchase redwood stock' followed by the number you want to buy. You currently have [redwoodshare-count] redwood stock."

Philip'sorange stock is a thing carried by the player.The printed name is "Philip's Orange stock x [Philip'sorangeshare-count]". Philip'sorange stock has a number called Philip'sorangeshare-count. Philip'sorange stock has a number called Philip'sorange-price. The Philip'sorange-price of the Philip'sorange stock is usually 200. The Philip'sorangeshare-count of the Philip'sorange stock is usually 100. The description of Philip'sOrange stock is "Stock that you own that you can sell any number of. Type 'sell orange stock' followed by the number you want to sell or 'puchase orange stock' followed by the number you want to buy. You currently have [Philip'sorangeshare-count] Orange stock."

Philip'sbackward stock is a thing carried by the player.The printed name is "Philip's backward stock x [Philip'sbackwardshare-count]". Philip'sbackward stock has a number called Philip'sbackwardshare-count. Philip'sbackward stock has a number called Philip'sbackward-price. The Philip'sbackward-price of the Philip'sbackward stock is usually 150. The Philip'sbackwardshare-count of the Philip'sbackward stock is usually 100. The description of Philip'sbackward stock is "Stock that you own that you can sell any number of. Type 'sell backward stock' followed by the number you want to sell or 'puchase backward stock' followed by the number you want to buy. You currently have [Philip'sbackwardshare-count] backward stock."

Philip'sredwood stock is a thing carried by the player.The printed name is "Philip's Redwood stock x [Philip'sredwoodshare-count]". Philip'sredwood stock has a number called Philip'sredwoodshare-count. Philip'sredwood stock has a number called Philip'sredwood-price. The Philip'sredwood-price of the Philip'sredwood stock is usually 100. The Philip'sredwoodshare-count of the Philip'sredwood stock is usually 20. The description of Philip'sredwood stock is "Stock that you own that you can sell any number of. Type 'sell Philip'sredwood stock' followed by the number you want to sell or 'puchase redwood stock' followed by the number you want to buy. You currently have [Philip'sredwoodshare-count] redwood stock."


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
	Otherwise:		
		if player is in Philip's Cubical:
			if Philip'sComputer is 1:
				if the noun is Philip'sorange stock:
					decrease the Philip'sorangeshare-count of the Philip'sOrange stock by the number understood;
					if the Philip'sorangeshare-count of the Philip'sorange stock is less than zero:
						increase the Philip'sorangeshare-count by the number understood;
						say "You don't have that many stock to sell. You have [Philip'sorangeshare-count] Orange stock.";
					otherwise:
						let C be the Philip'sorange-price of the Philip'sorange stock;
						let A be the number understood;
						let B be C * A;
						increase Philip'sMoney by B;
						say "Now you have [Philip'sOrangeshare-count] Orange stock and [Philip'sMoney] dollars.";
				Otherwise:
					if the noun is Philip'sbackward stock:
						decrease the Philip'sbackwardshare-count of the Philip'sbackward stock by the number understood;
						if the Philip'sbackwardshare-count of the Philip'sbackward stock is less than zero:
							increase the Philip'sbackwardshare-count by the number understood;
							say "You don't have that many stock to sell. You have [Philip'sbackwardshare-count] backward stock.";
						otherwise:
							let C be the Philip'sbackward-price of the Philip'sbackward stock;
							let A be the number understood;
							let B be C * A;
							increase Philip'sMoney by B;
							say "Now you have [Philip'sbackwardshare-count] backward stock and [Philip'sMoney] dollars.";
					Otherwise:
						if the noun is Philip'sredwood stock:
							decrease the Philip'sredwoodshare-count of the Philip'sredwood stock by the number understood;
							if the Philip'sredwoodshare-count of the philip'sredwood stock is less than zero:
								increase the Philip'sredwoodshare-count by the number understood;
								say "You don't have that many stock to sell. You have [Philip'sredwoodshare-count] redwood stock.";
							otherwise:
								let C be the Philip'sredwood-price of the Philip'sredwood stock;
								let A be the number understood;
								let B be C * A;
								increase Philip'sMoney by B;
								say "Now you have [Philip'sredwoodshare-count] redwood stock and [Philip'sMoney] dollars.";

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
	Otherwise:
		if player is in Philip's Cubical:
			if Philip'sComputer is 1:
				if the noun is Philip'sorange stock:
					increase the Philip'sorangeshare-count of the Philip'sOrange stock by the number understood;
					let C be the Philip'sorange-price of the Philip'sorange stock;
					let A be the number understood;
					let B be C * A;
					decrease Philip'sMoney by B;
					if Money is less than zero:
						increase the Philip'sorangeshare-count by the number understood;
						say "You don't have enought money.";
					otherwise:
						say "Now you have [Philip'sorangeshare-count] Orange stock and [Philip'sMoney] dollars.";
				Otherwise:
					if the noun is backward stock:
						increase the Philip'sbackwardshare-count of the Philip'sbackward stock by the number understood;
						let C be the Philip'sbackward-price of the Philip'sbackward stock;
						let A be the number understood;
						let B be C * A;
						decrease Money by B;
						if Philip'sMoney is less than zero:
							increase the Philip'sbackwardshare-count by the number understood;
							say "You don't have enought money.";
						otherwise:
							say "Now you have [Philip'sbackwardshare-count] backward stock and [Philip'sMoney] dollars.";
					Otherwise:
						if the noun is Philip'sredwood stock:
							increase the Philip'sredwoodshare-count of the Philip'sredwood stock by the number understood;
							let C be the Philip'sredwood-price of the Philip'sredwood stock;
							let A be the number understood;
							let B be C * A;
							decrease Philip'sMoney by B;
							if Money is less than zero:
								increase the Philip'sredwoodshare-count by the number understood;
								say "You don't have enought money.";
							otherwise:
								say "Now you have [Philip'sredwoodshare-count] redwood stock and [Philip'sMoney] dollars.";

[code for buying stocks created with a great deal of help from Mrs. Kiang]

Instead of examining Old Computer:
	if OldComputerState is 0:
		say "The computer is currently displaying your Boss's stock portofolio. It mainly consists of three stocks Orange, RedWood, and Backward. To your shock and dismay you realize that over the course of the last 10 minutes your Boss's portofolio has lost 10 percent equating to almost 13 million dollars. And the stocks' value are still plumiting. You'll have to act fast to save your clients. You try to remember how you Boss sold stocks. You think that he just typed sell or purchase, the stocks name, and the number of shares to buy or sell.";
	otherwise:
		say "A giant monitor rests upon your Boss's desk humming away.";

Corded Phone is scenery. It is in Boss's Cubical.

Filling Cabinet is in Boss's Cubical. Filling Cabinet is an openable container. Filling Cabinet is lockable and locked. It is undescribed. Cabinet Key unlocks the Filling Cabinet. The description is "This is where your Boss keeps all his records. Perhaps there may be something incriminating inside but you Boss has the key."

Notes is a thing. It is in Filling Cabinet. "You knew your Boss would be to lazy to cover his tracks. Scattered throughout the various files are notes from conversations with the employes of numerous companies talking about products before they had been publicly announced. These are most definitely illegal and more than enough to get your Boss arrested but maybe there won't be a need for that perhaps you should talk to him."

Boss carries cabinet key.

Philip's Cubical is a room. It is east of Floor One Hallway.

Philip's Computer is scenery. It is in Philip's Cubical.

Philip's Stocks is scenery. It is in Philip's Cubical. "[if Philip'sComputer is 0] You can't see them because Philip's Computer is currently locked. [otherwise if Philip'sComputer is 1] Philip is currently owns [Philip'sOrange Stock] orange stocks, [Philip'sRedWood Stock] Redwood Stocks, and [Philip'sBackward Stock] Backward. He has [Philip'sMoney] dollars."

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

Ground Floor Button is scenery. It is in Floor One Elevator. "The button has a large embroidered G on it."

Floor One Button is scenery. It is in Floor One Elevator. "The button has a large embroidered 1 on it."

Floor Two Button is scenery. It is in Floor One Elevator. "The button has a large embroidered 2 on it."

[Code for Elevator]

Instead of pushing Ground Floor Button:
	say "You disinterestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a bustling lobby.";
	move player to Lobby;
	move Ground Floor Button to Lobby Elevator;
	move Floor One Button to Lobby Elevator;
	move Floor Two  Button to Lobby Elevator;
	
Instead of pushing Floor One Button:
	say "You disinterestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a endless sea of cubicals.";
	move player to Floor One Hallway;
	move Ground Floor Button to Floor One Elevator;
	move Floor One Button to Floor One Elevator;
	move Floor Two  Button to Floor One Elevator;
	
Instead of pushing Floor Two Button:
	say "You disinterestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a expansive reception room.";
	move player to Reception;
	move Ground Floor Button to Floor Two Elevator;
	move Floor One Button to Floor Two Elevator;
	move Floor Two  Button to Floor Two Elevator;

Lobby is a room. It is west of Lobby Elevator. "The lobby is bustling with activity. Dozens of former employees are being escorted off company ground carring their supplies in little cardboard boxes."

Cafe is a room. It is north of Lobby.

Meeting Room is a room. It is south of Lobby.

After going south from Lobby for the first time:
	say "You are one of the last employees to file into the Meeting room. It's jampacked containing more than 30 employees. Jonathan the senior offical in this branch of Merrill Lynch laboriously clambors on top of the table to adress everyone assembled. 'I think most of you know why we are here but in case you've been asleep for the past five hours I'll recap. The DOW just droped 250 points in one day and our analyists predict it isn't going to get better for a very long time. Therefore, merrill Lynch will not be able to keep all of you. In fact we can only keep three. It shouldn't surrpise anyone that we are keeping Andrew who has been our most sucsessful trader for 2 years straight now. The other two are a bit more surrprising Philip and employee number 27?' Your Boss perks up and says, 'That would be me sir.' 'Ah of course well you can stay. Everyone else has 3 hours to pack and leave.' You can't afford to lose this job. It's the only thing paying your rent there must be some way to take your Boss's place after all it was you who saved his stocks. Perhapse there might be something in his office.";
	increase gamestate by 1;
	increase boss'sconversation by 1;

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

