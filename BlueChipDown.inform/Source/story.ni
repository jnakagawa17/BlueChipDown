"BlueChipDown" by Jonathan Nakagawa

When play begins: say "'Hurry up! I thought I asked you for those copies five minutes ago.' You have had this internship a Merrill Lynch, one of the largest investment companies in the world, for less than two days and already contimplated 'acidently' pushing your Boss out a window 12 times. Standing up from the file you've been sorting you turn to your boss and manage to say, 'Alright I'm going to make copies just give me ten seconds.' His face turns and even darker shade of red as he shouts, 'No! You stay here I don't want to have to wait another hour.' and leaves the room."

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

[Global:] Attendant'sConversation is a number that varies. Attendant'sConversation is 0.

[Global:] Client'sConversation is a number that varies. Client'sConversation is 0.

[Global:] Consultant'sConversation is a number that varies. Consultant'sConversation is 0.

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
			say "The computer stops its insistant bleeping just as a voice booms out from a hidden speaker, 'All employees come directly to the meeting room.' You recall the meeting room is south out of your office, west through the hallway into the elevator, down to the ground floor, and finally south from the lobby.";
	
Every turn:
	if failure is 1:
		end the story finally saying "You are fired.";
	
The description of player is "[if GameState is 0] After getting out of college strapped to cripling debt you couldn't afford much more than a couple second hand dress shirts and an imitation watch."

Boss's Cubical is a room. "[if GameState is 0] Perhaps this room, if it can even be called a room, is the reason your Boss is constantly angry. Barely large enough for you to take a step in any direction everything is within easy arms reach. Not that there is much here an old computer sitting on a desk, a filling cabinet, and corded phone. The computer is insistantly beeping. [otherwise] Perhaps this room, if it can even be called a room, is the reason your Boss is constantly angry. Barely large enough for you to take a step in any direction everything is within easy arms reach. Not that there is much here an old computer sitting on a desk, a filling cabinet, and corded phone."

Boss is a man. It is in Boss's Cubical. It is undescribed. The description is "From day to day your Boss never seem change his appearence. He must own at least a dozen of the same set of plain clothes. Whenever he sees you his face turns a deep beetroot red and he seems to inflate." 

Instead of talking to Boss:
	say "You could say: [if Boss'sConversation is 1][Line break][bracket]1[close bracket]'Could I have the key for the cabinet?'[Line break][otherwise if Boss'sConversation is 2][bracket]2[close bracket]'Because I said so and thats the only reason you should need!'[Line break][bracket]3[close bracket]'I'm going to write one final report on how you saved your client's funds.'[Line break][otherwise if player carries Notes][Bracket]4[Close Bracket]'Hey, Boss look at this!'";
	
Casting Ask For Key is an action applying to nothing.
Understand "1" as casting Ask For Key.
Instead of casting Ask For Key:
	If player is in Boss's Cubical:
		if Boss'sConversation is 1:
			say "'Could I have the key for the cabinet?' you ask. 'Why should I give that?' your Boss responds.";
			increase Boss'sConversation by 1;
		Otherwise:
			if Consultant'sConversation is 1:
				decrease Money by 5000;
				if Money is less than zero:
					say "You don't have enough money.";
				otherwise:
					say "'Ok, I'll do it.' you say. 'My charts predict a rise in the worth of redwood.' he responds.";
					increase Consultant'sConversation by 1;
	Otherwise:
		If Player is in Cafe:
			say "'Hello. How are you doing today?' you ask. 'I would be a lot better if you wouldn't waste my time with pleasantries. I want to know what the Hell you are doing with my money!'";
			increase client'sConversation by 1;
			
Casting Be Rude is an action applying to nothing.
Understand "2" as casting Be Rude.
Instead of casting Be Rude:
	If player is in Boss's Cubical:
		if Boss'sConversation is 2:
			say "'Because I said so and thats the only reason you should need!' you say. 'Get out' your Boss screams.";
			Increase failure by 1;
		Otherwise:
			if Consultant'sConversation is 1:
				say "'No thanks' you say. 'No problem. Call again if you change your mind.' he responds.";
	Otherwise:
		If Player is in Cafe:
			say "'So why did you call me?' you ask. 'Ah, someone who gets straight to the point I like that. I want to know what you are planning to do with my money.'";
			increase Client'sConversation by 1;
			
Casting Be Polite is an action applying to nothing.
Understand "3" as casting Be Polite.
Instead of casting Be Polite:
	If player is in Boss's Cubical:
		if Boss'sConversation is 2:
			say "'I'm going to write one final report on how you saved your client's funds.' you say. 'Well... Alright.' he responds handing you the key.";
			Increase Boss'sConversation by 1;
			Move Cabinet Key to player;
	Otherwise:
		If Player is in Cafe:
			if Client'sConversation is 1:
				say "'When the stock market is in turmoil like it is now you have the chance to make much more than if it were stable. I have acsess to numerous charts and projections created by our best analyists. Have no fear I will keep your money safe.' you say. 'All your analysists predictions are rubish. I have my money invested in three different brokers and they constantly give me contradicting information. What stock do you intend to invest in right now?'";
				increase Client'sConversation by 1;
		
			
Casting Take Over is an action applying to nothing.
Understand "4" as casting Take Over.
Instead of casting Take Over:
	If player is in Boss's Cubical:
		if Boss'sConversation is 3:
			if player carries Notes:
				say "'Hey, Boss look at this!' you say gesturing with the notes. 'Give those to me!' he shouts. 'No. I'm not taking any more orders from you. Things go my way now. So this is what's going to happen. You are going to go to Jonathan and say that for personal reasons you have to resign.' 'Never.' he spits. 'Or would you prefer I go to the cops with this' you respond. 'Fine.' he said turning to leave. A few minutes later your phone begins to ring.";
				Increase Boss'sConversation by 1;
				Move Boss to The Void;
	Otherwise:
		If Player is in Cafe:
			if Client'sConversation is 1:
				say "'I'm going to make more of it.' you say. 'I like that' she responds. 'I think you are going to make a good broker so I'll give you some advice. One of my other brokers tells me that redwood is going to do well soon. Well that's all for now.' She stands up and exits.";
				increase Client'sConversation by 2;
				move Client to the void;
			
Casting Being Correct is an action applying to nothing.
Understand "5" as casting Being Correct.
Instead of casting Being Correct:
	If Player is in Cafe:
		If Client'sConversation is 2:
			say "'Redwood' you guess. 'Well mabey you are smarter than I thought. That's what some of my other brokers tell me. Well that's all for now.' She gets up and leaves.";
			increase Client'sConversation by 1;
			Move client to the void;
				
Casting Being wrong is an action applying to nothing.
Understand "6" as casting Being wrong.
Instead of casting Being wrong:
	If Player is in Cafe:
		If Client'sConversation is 2:
			say "'Orange.' you guess. 'I don't think you are going to do very well in finance. Many of my other brokers tell me that Orange isn't going to do well. That's all for now.' She stands up and leaves.";
			increase Client'sConversation by 1;
			Move client to the void;
			
Casting Being incorrect is an action applying to nothing.
Understand "7" as casting Being incorrect.
Instead of casting Being incorrect:
	If Player is in Cafe:
		If Client'sConversation is 2:
			say "'Backward.' you guess. 'I don't think you are going to do very well in finance. Many of my other brokers tell me that Backward isn't going to do well. That's all for now.' She stands up and leaves.";
			increase Client'sConversation by 1;
			Move client to the void;

Casting Answer Phone is an action applying to nothing.
Understand "answer phone" as casting Answer Phone.
Instead of casting Answer Phone:
	If player is in Boss's Cubical:
		if Boss'sConversation is 4:
			say "'Hello this is Jonathan. I understand that you are an intern at our company. Your former Boss just resigned and you are the one who best knows his clients and investments. So we are going to keep you on for five days in order to find a more sutiable replacement. Just try to keep your client's satisfied.' Five days. You have five days to prove your worth to the company and stay on the payroll. After you have made the stock trades you want to for the day write 'Go home' to advance to the next day. Some of the stock prices will change over the night.";
			Increase Boss'sConversation by 1;
			Move Cabinet Key to player;
			
Casting Consult is an action applying to nothing.
Understand "123-4567" or "call 123-4567" as casting Consult.
Instead of casting Consult:
	If player is in Boss's Cubical:
		if Gamestate is 4:
			if Consultant'sConversation is 0:
				say "'Hello are you a financial analyst?' you ask. ''That is correct. For the small fee of 5,000 dollars I can give you my prediction. [line break][bracket]1[close bracket]'Ok'[line break][bracket]2[close bracket]'No thanks'";
				increase Consultant'sConversation by 1;

Old Computer is scenery. It is in Boss's Cubical.

Understand "sell [something] [number]" as selling. Selling is an action applying to one thing and one number.

orange stock is a thing carried by the player.The printed name is "Orange stock x [orangeshare-count]". orange stock has a number called orangeshare-count. orange stock has a number called orange-price. The orange-price of the orange stock is usually 200. The orangeshare-count of the orange stock is usually 100. The description of Orange stock is "Stock that you own that you can sell any number of. Type 'sell orange stock' followed by the number you want to sell or 'puchase orange stock' followed by the number you want to buy. You currently have [orangeshare-count] Orange stock. They cost [orange-price] dollars a share."

Casting sleep is an action applying to nothing.
Understand "Go Home" as casting sleep.
Instead of casting sleep:
	say "Another day ends as you lock in your final trades. You arrive back in the lobby after another long day.";
	if gamestate is 2:
		decrease orange-price of the orange stock by 60;
		decrease Philip'sorange-price of the Philip'sorange stock by 60;
		increase redwood-price of the redwood stock by 10;
		increase Philip'sredwood-price of the Philip'sredwood stock by 10;
		increase backward-price of the backward stock by 50;
		increase Philip'sbackward-price of the Philip'sbackward stock by 50;
		move Today's Newspaper to the void;
		move Client to Cafe;
		Move Player to Lobby;
		move Ground Floor Button to Lobby Elevator;
		move Floor One Button to Lobby Elevator;
		move Floor Two Button to Lobby Elevator;
		move Poster to Lobby Elevator;
		increase gamestate by 1;
	Otherwise:
		if gamestate is 3:
			decrease orange-price of the orange stock by 20;
			decrease Philip'sorange-price of the Philip'sorange stock by 20;
			increase redwood-price of the redwood stock by 30;
			increase Philip'sredwood-price of the Philip'sredwood stock by 30;
			decrease backward-price of the backward stock by 40;
			decrease Philip'sbackward-price of the Philip'sbackward stock by 40;
			move call card to Boss's Cubical;
			move Client to the Void;
			Move Player to Lobby;
			move Ground Floor Button to Lobby Elevator;
			move Floor One Button to Lobby Elevator;
			move Floor Two Button to Lobby Elevator;
			move Poster to Lobby Elevator;
			increase gamestate by 1;
		Otherwise:
			if gamestate is 4:
				decrease orange-price of the orange stock by 30;
				decrease Philip'sorange-price of the Philip'sorange stock by 30;
				increase redwood-price of the redwood stock by 20;
				increase Philip'sredwood-price of the Philip'sredwood stock by 20;
				increase backward-price of the backward stock by 5;
				increase Philip'sbackward-price of the Philip'sbackward stock by 5;
				Increase Consultant'sConversation by 5;
				Move Player to Lobby;
				move Ground Floor Button to Lobby Elevator;
				move Floor One Button to Lobby Elevator;
				move Floor Two Button to Lobby Elevator;
				move Poster to Lobby Elevator;
				increase gamestate by 1;
			Otherwise:
				if gamestate is 5:
					increase orange-price of the orange stock by 250;
					increase Philip'sorange-price of the Philip'sorange stock by 250;
					decrease redwood-price of the redwood stock by 35;
					increase Philip'sredwood-price of the Philip'sredwood stock by 35;
					increase backward-price of the backward stock by 20;
					increase Philip'sbackward-price of the Philip'sbackward stock by 20;
					Move Player to Lobby;
					move Ground Floor Button to Lobby Elevator;
					move Floor One Button to Lobby Elevator;
					move Floor Two Button to Lobby Elevator;
					move Poster to Lobby Elevator;
					increase gamestate by 1;

backward stock is a thing carried by the player.The printed name is "backward stock x [backwardshare-count]". backward stock has a number called backwardshare-count. backward stock has a number called backward-price. The backward-price of the backward stock is usually 150. The backwardshare-count of the backward stock is usually 100. The description of backward stock is "Stock that you own that you can sell any number of. Type 'sell backward stock' followed by the number you want to sell or 'puchase backward stock' followed by the number you want to buy. You currently have [backwardshare-count] backward stock. They cost [backward-price] dollars a share."

redwood stock is a thing carried by the player.The printed name is "Redwood stock x [redwoodshare-count]". redwood stock has a number called redwoodshare-count. redwood stock has a number called redwood-price. The redwood-price of the redwood stock is usually 100. The redwoodshare-count of the redwood stock is usually 20. The description of redwood stock is "Stock that you own that you can sell any number of. Type 'sell redwood stock' followed by the number you want to sell or 'puchase redwood stock' followed by the number you want to buy. You currently have [redwoodshare-count] redwood stock. They cost [redwood-price] dollars a share."

Philip'sorange stock is a thing. It is in The Void. The printed name is "Philip's Orange stock x [Philip'sorangeshare-count]". Philip'sorange stock has a number called Philip'sorangeshare-count. Philip'sorange stock has a number called Philip'sorange-price. The Philip'sorange-price of the Philip'sorange stock is usually 200. The Philip'sorangeshare-count of the Philip'sorange stock is usually 100. The description of Philip'sOrange stock is "Stock that you own that you can sell any number of. Type 'sell orange stock' followed by the number you want to sell or 'puchase orange stock' followed by the number you want to buy. You currently have [Philip'sorangeshare-count] Orange stock. They cost [Philip'sorange-price] dollars a share."

Philip'sbackward stock is a thing. It is in The Void. The printed name is "Philip's backward stock x [Philip'sbackwardshare-count]". Philip'sbackward stock has a number called Philip'sbackwardshare-count. Philip'sbackward stock has a number called Philip'sbackward-price. The Philip'sbackward-price of the Philip'sbackward stock is usually 150. The Philip'sbackwardshare-count of the Philip'sbackward stock is usually 100. The description of Philip'sbackward stock is "Stock that you own that you can sell any number of. Type 'sell backward stock' followed by the number you want to sell or 'puchase backward stock' followed by the number you want to buy. You currently have [Philip'sbackwardshare-count] backward stock. They cost [Philip'sbackward-price] dollars a share."

Philip'sredwood stock is a thing. It is in The Void. The printed name is "Philip's Redwood stock x [Philip'sredwoodshare-count]". Philip'sredwood stock has a number called Philip'sredwoodshare-count. Philip'sredwood stock has a number called Philip'sredwood-price. The Philip'sredwood-price of the Philip'sredwood stock is usually 100. The Philip'sredwoodshare-count of the Philip'sredwood stock is usually 20. The description of Philip'sredwood stock is "Stock that you own that you can sell any number of. Type 'sell Philip'sredwood stock' followed by the number you want to sell or 'puchase redwood stock' followed by the number you want to buy. You currently have [Philip'sredwoodshare-count] redwood stock. They cost [Philip'sredwood-price] dollars a share."


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
				decrease the orangeshare-count by the number understood;
				increase Money by B;
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
					decrease the backwardshare-count by the number understood;
					increase money by B;
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
						decrease the redwoodshare-count by the number understood;
						increase Money by B;
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
						decrease the Philip'sorangeshare-count by the number understood;
						increase Philip'sMoney by B;
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
							decrease the Philip'sbackwardshare-count by the number understood;
							increase Philip'sMoney by B;
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
								decrease the Philip'sredwoodshare-count by the number understood;
								increase Philip'sMoney by B;
								say "You don't have enought money.";
							otherwise:
								say "Now you have [Philip'sredwoodshare-count] redwood stock and [Philip'sMoney] dollars.";

[code for buying stocks created with a great deal of help from Mrs. Kiang]

Instead of examining Old Computer:
	if OldComputerState is 0:
		say "The computer is currently displaying your Boss's stock portofolio. It mainly consists of three stocks Orange, RedWood, and Backward. To your shock and dismay you realize that over the course of the last 10 minutes your Boss's portofolio has lost 10 percent equating to almost 13 million dollars. And the stocks' value are still plumiting. You'll have to act fast to save your clients. You try to remember how you Boss sold stocks. You think that he just typed sell or purchase, the stocks name, and the number of shares to buy or sell.";
	otherwise:
		say "A giant monitor rests upon your Boss's desk humming away.";

Corded Phone is scenery. It is in Boss's Cubical. The description is "The phone is currently dormant with no messages and there isn't anyone you really want to call right now."

Filling Cabinet is in Boss's Cubical. Filling Cabinet is an openable container. Filling Cabinet is lockable and locked. It is undescribed. The description is "This is where your Boss keeps all his records. Perhaps there may be something incriminating inside but you Boss has the key." Cabinet Key unlocks the Filling Cabinet.

Notes is a thing. It is in Filling Cabinet. The description is "You knew your Boss would be to lazy to cover his tracks. Scattered throughout the various files are notes from conversations with the employes of numerous companies talking about products before they had been publicly announced. These are most definitely illegal and more than enough to get your Boss arrested but maybe there won't be a need for that perhaps you should talk to him."

Desk is scenery. It is in Boss's Cubical. "Made of plastic the desk is rather sparsely deccorated only having a computer and phone sitting on top of it."

Boss carries cabinet key.

Philip's Cubical is a room. It is east of Floor One Hallway. "Philip's cubical while still small is significantly larger than yours. His computer is slightly less clunky than yours and has a stapler sitting next to it. Otherwise his office is mostly empty."

Philip's Computer is scenery. It is in Philip's Cubical. "[if Philip'sComputer is 0] Philip's Computer is currently locked with a password if you could find out what it is you could acsess his stocks. [otherwise if Philip'sComputer is 1] Philip is currently owns [Philip'sOrange Stock] orange stocks, [Philip'sRedWood Stock] Redwood Stocks, and [Philip'sBackward Stock] Backward. He has [Philip'sMoney] dollars."

Philip's Stocks is scenery. It is in Philip's Cubical. "[if Philip'sComputer is 0] You can't see them because Philip's Computer is currently locked. [otherwise if Philip'sComputer is 1] Philip is currently owns [Philip'sOrange Stock] orange stocks, [Philip'sRedWood Stock] Redwood Stocks, and [Philip'sBackward Stock] Backward. He has [Philip'sMoney] dollars."

Stapler is a thing. It is in Philip's Cubical. The description is "test"

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

Floor One Elevator is a room. It is west of Floor One Hallway. "The company elevator is lined by decorative wodden panneling. A poster is a fixed to the wall directly across from the door and three buttons are just to the right of the door. They read Ground Floor, Floor One, and Floor Two. The exit is to the west."

Ground Floor Button is scenery. It is in Floor One Elevator. "The button has a large embroidered G on it."

Floor One Button is scenery. It is in Floor One Elevator. "The button has a large embroidered 1 on it."

Floor Two Button is scenery. It is in Floor One Elevator. "The button has a large embroidered 2 on it."

Poster is scenery. It is in Floor One Elevator. "The poster display's a gaint bull Merill Lynch's mascot with the subtext 'Be Bullish'."

[Code for Elevator]

Instead of pushing Ground Floor Button:
	say "You disinterestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a bustling lobby.";
	move player to Lobby;
	move Ground Floor Button to Lobby Elevator;
	move Floor One Button to Lobby Elevator;
	move Floor Two Button to Lobby Elevator;
	move Poster to Lobby Elevator;
	
Instead of pushing Floor One Button:
	say "You disinterestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a endless sea of cubicals.";
	move player to Floor One Hallway;
	move Ground Floor Button to Floor One Elevator;
	move Floor One Button to Floor One Elevator;
	move Floor Two Button to Floor One Elevator;
	move Poster to Floor One Elevator;
	
Instead of pushing Floor Two Button:
	say "You disinterestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a expansive reception room.";
	move player to Reception;
	move Ground Floor Button to Floor Two Elevator;
	move Floor One Button to Floor Two Elevator;
	move Floor Two Button to Floor Two Elevator;
	move Poster to Floor Two Elevator;

Lobby is a room. It is west of Lobby Elevator. "The lobby is bustling with activity. Dozens of former employees are being escorted off company ground carring their supplies in little cardboard boxes."

Cafe is a room. It is north of Lobby. "This is where the less succsessful financial investors tend to meet their clients. [if gamestate is 3]"

Client is a woman. It is in the void.

Instead of talking to Client:
	say "You could say: [if Client'sConversation is 0][Line break][bracket]1[close bracket]'Hello. How are you doing today?'[Line break][bracket]2[close bracket]'So why did you call me?'[otherwise if Client'sConversation is 1][Line break][bracket]3[close bracket]'When the stock market is in turmoil like it is now you have the chance to make much more than if it were stable. I have acsess to numerous charts and projections created by our best analyists. Have no fear I will keep your money safe.'[Line break][Bracket]4[Close Bracket]'I'm going to make more of it.'[otherwise if Client'sConversation is 2][Line break][bracket]5[close bracket]'Redwood'[Line break][bracket]6[close bracket]'Orange'[Line break][bracket]7[close bracket]'Backward'";

Meeting Room is a room. It is south of Lobby. "The room is dominated by a by a large glass table placed squarely in the center of the room. In the front of the room is a projector screen and back to the north is the lobby."

After going south from Lobby for the first time:
	say "You are one of the last employees to file into the Meeting room. It's jampacked containing more than 30 employees. Jonathan the senior offical in this branch of Merrill Lynch laboriously clambors on top of the table to adress everyone assembled. 'I think most of you know why we are here but in case you've been asleep for the past five hours I'll recap. The DOW just droped 250 points in one day and our analyists predict it isn't going to get better for a very long time. Therefore, merrill Lynch will not be able to keep all of you. He begins to rattle off a list of names and and fianlly employee number 27?' Your Boss perks up and says, 'That would be me sir.' 'Ah of course well you can stay. Everyone else has 3 hours to pack and leave.' You can't afford to lose this job. It's the only thing paying your rent there must be some way to take your Boss's place after all it was you who saved his stocks. Perhapse there might be something in his office.";
	increase gamestate by 1;
	increase boss'sconversation by 1;
	move player to Meeting Room;

Large Glass Table is scenery. It is in Meeting Room. "On top of the table is today's newspaper."

Today's Newspaper is a thing. It is in Meeting Room. It is undescribed. The description is "The newspaper is almost entirely devoted to the stock market dropping. The second page reads, 'This is a not a minor event that's going to go away in a night. I expect orange's stock to keep dropping for the forseeable future.'"

Lobby Elevator is a room. "The company elevator is lined by decorative wodden panneling. A poster is a fixed to the wall directly across from the door and three buttons are just to the right of the door. They read Ground Floor, Floor One, and Floor Two. The exit is to the west."

Floor Two Elevator is a room. "The company elevator is lined by decorative wodden panneling. A poster is a fixed to the wall directly across from the door and three buttons are just to the right of the door. They read Ground Floor, Floor One, and Floor Two. The exit is to the west."

Reception is a room. It is south of Floor Two Elevator.

Attendant is a woman. It is in Reception.

Instead of talking to Attendant:
	say "You could say: [if Attendant'sConversation is 0]You have nothing to say[otherwise if Attendant'sConversation is 1][Line break][bracket]1[close bracket]'May I speak Jonathan?'[Line break][otherwise if Attendant'sConversation is 2][bracket]2[close bracket]'Because I said so and thats the only reason you should need!'";

CEO Office is a room. It is west of Reception. 

Call Card is a thing. It is in the void. The description is "Financial Analyst for Hire [line break] Contact us at '123-4567'"

The Void is a room.

