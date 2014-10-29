"BlueChipDown" by Jonathan Nakagawa
The release number is 1.
The story creation year is 2014.
The story headline is "BlueChipDown".
The story genre is "Adventure".

When play begins: say "'Hurry up! I thought I asked you for those copies five minutes ago.' You have had this internship a Merrill Lynch, one of the largest investment companies in the world, for less than two days and already contemplated 'accidently' pushing your Boss out a window 12 times. Standing up from the file you've been sorting you turn to your boss and manage to say, 'Alright I'm going to make copies just give me ten seconds.' His face turns and even darker shade of red as he shouts, 'No! You stay here I don't want to have to wait another hour.' and leaves the room."

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

[Global:] TheEnd is a number that varies. TheEnd is 0.

[Global:] Phillip'sComputer is a number that varies. Phillip'sComputer is 0.

[Global:] OldComputerState is a number that varies. OldComputerState is 0.

[Global:] Money is a number that varies. Money is 0.

[Global:] Phillip'sMoney is a number that varies. Phillip'sMoney is 0.

[Global:] Boss'sConversation is a number that varies. Boss'sConversation is 0.

[Global:] Attendant'sConversation is a number that varies. Attendant'sConversation is 0.

[Global:] Client'sConversation is a number that varies. Client'sConversation is 0.

[Global:] Consultant'sConversation is a number that varies. Consultant'sConversation is 0.

[Global:] TempLoop is a number that varies. TempLoop is 0.

[Global:] TempCon is a number that varies. TempCon is 0.

[Global:] FinalCheck is a number that varies. FinalCheck is 0.

[Global:] IHack is a number that varies. IHack is 0.

[Global:] PhilipHack is a number that varies. PhilipHack is 0.

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
			say "The computer stops its insistent bleeping just as a voice booms out from a hidden speaker, 'All employees come directly to the meeting room.' You recall the meeting room is south out of your office, west through the hallway into the elevator, down to the ground floor, and finally south from the lobby.";
			increase oldcomputerstate by 1;
	Otherwise:
		if Gamestate is 6:
			if TempLoop is 0:
				if orangeshare-count of the orange stock is 0:
					if backwardshare-count of the backward stock is 0:
						if redwoodshare-count of the redwood stock is 0:
							say "You phone begins to ring again.";
							increase TempLoop by 1;
	
Every turn:
	if failure is 1:
		end the story finally saying "You are fired.";

Every turn:
	if Obscene Photos is in Imgur for the first time:
		say "Just as you upload the photos and log out Jonathan re-enters the room.";
		move Imgur to the void;
		move Pictures Folder to the void;
		move Jonathan to CEO Office;
		increase IHack by 1;
		
[Every turn rules]

The description of player is "[if GameState is 0] After getting out of college strapped to crippling debt you couldn't afford much more than a couple second hand dress shirts and an imitation watch."

Boss's Cubical is a room. "[if GameState is 0] Perhaps this room, if it can even be called a room, is the reason your Boss is constantly angry. Barely large enough for you to take a step in any direction everything is within easy arms reach. Not that there is much here an old computer sitting on a desk, a filling cabinet, and corded phone. The computer is insistently beeping. [otherwise if Boss is in Boss's Cubical] Perhaps this room, if it can even be called a room, is the reason your Boss is constantly angry. Barely large enough for you to take a step in any direction everything is within easy arms reach. Not that there is much here an old computer sitting on a desk, a filling cabinet, and corded phone. Your Boss is standing in the corner.[Otherwise]Perhaps this room, if it can even be called a room, is the reason your Boss is constantly angry. Barely large enough for you to take a step in any direction everything is within easy arms reach. Not that there is much here an old computer sitting on a desk, a filling cabinet, and corded phone."

Boss is a man. It is in Boss's Cubical. It is undescribed. The description is "From day to day your Boss never seem change his appearance. He must own at least a dozen of the same set of plain clothes. Whenever he sees you his face turns a deep beetroot red and he seems to inflate." 

Instead of talking to Boss:
	say "You could say: [if Boss'sConversation is 1][Line break][bracket]1[close bracket]'Could I have the key for the cabinet?'[Line break][otherwise if Boss'sConversation is 2][bracket]2[close bracket]'Because I said so and that's the only reason you should need!'[Line break][bracket]3[close bracket]'I'm going to write one final report on how you saved your client's funds.'[Line break][otherwise if player carries Notes][Bracket]4[Close Bracket]'Hey, Boss look at this!'";
	
Casting Ask For Key is an action applying to nothing.
Understand "1" as casting Ask For Key.
Instead of casting Ask For Key:
	If player is in Boss's Cubical:
		if Boss'sConversation is 1:
			say "'Could I have the key for the cabinet?' you ask. 'Why should I give that?' your Boss responds.";
			increase Boss'sConversation by 1;
		Otherwise:
			if Consultant'sConversation is 0:
				decrease Money by 5000;
				if Money is less than zero:
					say "You don't have enough money.";
				otherwise:
					say "'Ok, I'll do it.' you say. 'My charts predict a rise in the worth of redwood.' he responds.";
					increase Consultant'sConversation by 1;
	Otherwise:
		if player is in Reception:
			if Attendant'sConversation is 1:
				say "'May I speak Jonathan?' you enquire. 'Do you have an appointment?' the woman responds.";
				increase attendant'sconversation by 1;
		Otherwise:
			If Player is in Cafe:
				say "'Hello. How are you doing today?' you ask. 'I would be a lot better if you wouldn't waste my time with pleasantries. I want to know what the Hell you are doing with my money!'";
				increase client'sConversation by 1;
			
Casting Be Rude is an action applying to nothing.
Understand "2" as casting Be Rude.
Instead of casting Be Rude:
	If player is in Boss's Cubical:
		if Boss'sConversation is 2:
			say "'Because I said so and that's the only reason you should need!' you say. 'Get out' your Boss screams.";
			Increase failure by 1;
		Otherwise:
			if Consultant'sConversation is 0:
				say "'No thanks' you say. 'No problem. Call again if you change your mind.' he responds.";
	Otherwise:
		If Player is in Cafe:
			say "'So why did you call me?' you ask. 'Ah, someone who gets straight to the point I like that. I want to know what you are planning to do with my money.'";
			increase Client'sConversation by 1;
		Otherwise:
			if player is in Reception:
				if Attendant'sConversation is 1:
					say "'Hello, how has your day been?' you ask. 'Not great dear. Jonathan in recent years hasn't been very kind to me. And I fear that after these recent firings I'm going to be worked harder than ever.'";
					increase attendant'sconversation by 2;
			
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
				say "'When the stock market is in turmoil like it is now you have the chance to make much more than if it were stable. I have access to numerous charts and projections created by our best analysts. Have no fear I will keep your money safe.' you say. 'All your analyst's predictions are rubbish. I have my money invested in three different brokers and they constantly give me contradicting information. What stock do you intend to invest in right now?'";
				increase Client'sConversation by 1;
		Otherwise:
			if player is in Reception:
				if Attendant'sConversation is 2:
					if TempLoop is 1:
						say "'Yes, he asked for me.' you say. 'Ok, head right in.' she responds.";
						increase attendant'sconversation by 1;
						now the CEO Door is unlocked;
					otherwise:
						say "'Yes, he asked for me.' you say. 'I don't see any appointments sorry.' she responds.";
					decrease attendant'sconversation by 1;
			
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
		Otherwise:
			if player is in Reception:
				if Attendant'sConversation is 2:
					say "'Never mind.' you say.";
					decrease attendant'sconversation by 1;
			
Casting Being Correct is an action applying to nothing.
Understand "5" as casting Being Correct.
Instead of casting Being Correct:
	If Player is in Cafe:
		If Client'sConversation is 2:
			say "'Redwood' you guess. 'Well maybe you are smarter than I thought. That's what some of my other brokers tell me. Well that's all for now.' She gets up and leaves.";
			increase Client'sConversation by 1;
			Move client to the void;
	Otherwise:
		if player is in Reception:
			if Attendant'sConversation is 3:
				say "'Well perhaps he has grown complacent and it's time for him to be replaced.' you say. 'You know maybe you're right. I think you would make a much better Boss's than him. Take this card it has Jonathan's password on it see what you can do with that.' Just then Jonathan exits his office saying, 'I'll be back in a second. I just need to use the bathroom for a second.'";
				decrease attendant'sconversation by 2;
				Move Jonathan to the void;
				Increase TempCon by 1;
				Move Password Card to player;
				Now CEO Door is unlocked;

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
			say "'Hello this is Jonathan. I understand that you are an intern at our company. Your former Boss just resigned and you are the one who best knows his clients and investments. So we are going to keep you on for five days in order to find a more suitable replacement. Just try to keep your client's satisfied.' Five days. You have five days to prove your worth to the company and stay on the payroll. After you have made the stock trades you want to for the day write 'Go home' to advance to the next day. Some of the stock prices will change over the night.";
			Increase Boss'sConversation by 1;
			Move Cabinet Key to player;
		Otherwise:
			if gamestate is 6:
				if finalCheck is 0:
					if TempLoop is 0:
						say "'Who is this?' you ask. 'It's Jonathan again. It has been four days. I would like you to try sell all the stocks you own so that I can asses your performance.' he responds";
						increase finalcheck by 1;
				otherwise:
					if TempLoop is 1:
						if Money is 249240:
							let C be the Phillip'sorange-price of the Phillip'sorange stock;
							let A be the number understood;
							let B be C * A;
							increase Phillip'sMoney by B;
							let D be the Phillip'sbackward-price of the Phillip'sbackward stock;
							let E be the number understood;
							let F be D * E;
							increase Phillip'sMoney by F;
							let G be the Phillip'sredwood-price of the Phillip'sredwood stock;
							let H be the number understood;
							let I be G * H;
							increase Phillip'sMoney by I;
							say "'Who is this?' you ask. 'It's Jonathan again. I would like to speak to you. Come to my office on the second floor.' he says.";
							If Phillip'sMoney is less than Money:
								increase PhilipHack by 1;
						otherwise:
							if money is greater than 150000:
								say "'Who is this?' you ask. 'It's Jonathan again. I would like to speak to you. Come to my office on the second floor.' he says.";
							otherwise:
								if money is greater than 50000:
									increase TheEnd by 2;
								otherwise:
									increase TheEnd by 1;
			
Casting Consult is an action applying to nothing.
Understand "123-4567" or "call 123-4567" as casting Consult.
Instead of casting Consult:
	If player is in Boss's Cubical:
		if Gamestate is 4:
			if Consultant'sConversation is 0:
				say "'Hello are you a financial analyst?' you ask. ''That is correct. For the small fee of 5,000 dollars I can give you my prediction. [line break][bracket]1[close bracket]'Ok'[line break][bracket]2[close bracket]'No thanks'";

[Ways to talk to people]

Casting Password is an action applying to nothing.
Understand "abcd1234" as casting Password.
Instead of casting Password:
	if player is in Phillip's Cubical:
		if Phillip'sComputer is 0:
			say "The computer gives a satisfying ding and you are logged in and able to see Phillip's Stocks.";
			increase Phillip'sComputer by 1;
		Otherwise:
			say "You already logged in."

Casting Hack is an action applying to nothing.
Understand "Jonathan is the best" or "type Jonathan is the best" as casting Hack.
Instead of casting Hack:
	If player is in CEO Office:
		if Gamestate is 6:
			if TempCon is 1:
				say "The computer dings and the lock screen disappears revealing the folder Pictures and his Imgur account. The imgur account reads 'Put a photo in imgur to upload it.'";
				increase TempCon by 1;
				move Pictures Folder to CEO Office;
				Move Imgur to CEO Office;

[Ways to hack into computers]

Old Computer is scenery. It is in Boss's Cubical.

Understand "sell [something] [number]" as selling. Selling is an action applying to one thing and one number.

orange stock is a thing carried by the player. The printed name is "Orange stock x [orangeshare-count]". orange stock has a number called orangeshare-count. orange stock has a number called orange-price. The orange-price of the orange stock is usually 200. The orangeshare-count of the orange stock is usually 100. The description of Orange stock is "Stock that you own that you can sell any number of. Type 'sell orange stock' followed by the number you want to sell or 'puchase orange stock' followed by the number you want to buy. You currently have [orangeshare-count] Orange stock. They cost [orange-price] dollars a share."

Casting sleep is an action applying to nothing.
Understand "Go Home" as casting sleep.
Instead of casting sleep:
	say "Another day ends as you lock in your final trades. You arrive back in the lobby after another long day.";
	if gamestate is 2:
		decrease orange-price of the orange stock by 60;
		decrease Phillip'sorange-price of the Phillip'sorange stock by 60;
		increase redwood-price of the redwood stock by 10;
		increase Phillip'sredwood-price of the Phillip'sredwood stock by 10;
		increase backward-price of the backward stock by 50;
		increase Phillip'sbackward-price of the Phillip'sbackward stock by 50;
		increase Phillip'sOrangeShare-count of the Phillip'sOrange Stock by 20;
		move Today's Newspaper to the void;
		move Client to Cafe;
		Move Player to Lobby;
		move Ground Floor Button to Lobby Elevator;
		move Floor One Button to Lobby Elevator;
		move Floor Two Button to Lobby Elevator;
		move Poster to Lobby Elevator;
		increase gamestate by 1;
		move Boss to the void;
		increase Boss'sconversation by 10;
	Otherwise:
		if gamestate is 3:
			decrease orange-price of the orange stock by 20;
			decrease Phillip'sorange-price of the Phillip'sorange stock by 20;
			increase redwood-price of the redwood stock by 30;
			increase Phillip'sredwood-price of the Phillip'sredwood stock by 30;
			decrease backward-price of the backward stock by 40;
			decrease Phillip'sbackward-price of the Phillip'sbackward stock by 40;
			increase Phillip'sredwoodShare-count of Phillip'sredwood Stock by 15;
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
				decrease Phillip'sorange-price of the Phillip'sorange stock by 30;
				increase redwood-price of the redwood stock by 20;
				increase Phillip'sredwood-price of the Phillip'sredwood stock by 20;
				increase backward-price of the backward stock by 5;
				increase Phillip'sbackward-price of the Phillip'sbackward stock by 5;
				increase Phillip'sBackwardShare-count of Phillip'sBackward Stock by 25;
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
					increase Phillip'sorange-price of the Phillip'sorange stock by 250;
					decrease redwood-price of the redwood stock by 35;
					increase Phillip'sredwood-price of the Phillip'sredwood stock by 35;
					increase backward-price of the backward stock by 20;
					increase Phillip'sbackward-price of the Phillip'sbackward stock by 20;
					Move Player to Lobby;
					move Ground Floor Button to Lobby Elevator;
					move Floor One Button to Lobby Elevator;
					move Floor Two Button to Lobby Elevator;
					move Poster to Lobby Elevator;
					increase gamestate by 1;
					increase attendant'sconversation by 1;

backward stock is a thing carried by the player. The printed name is "backward stock x [backwardshare-count]". backward stock has a number called backwardshare-count. backward stock has a number called backward-price. The backward-price of the backward stock is usually 150. The backwardshare-count of the backward stock is usually 100. The description of backward stock is "Stock that you own that you can sell any number of. Type 'sell backward stock' followed by the number you want to sell or 'puchase backward stock' followed by the number you want to buy. You currently have [backwardshare-count] backward stock. They cost [backward-price] dollars a share."

redwood stock is a thing carried by the player. The printed name is "Redwood stock x [redwoodshare-count]". redwood stock has a number called redwoodshare-count. redwood stock has a number called redwood-price. The redwood-price of the redwood stock is usually 100. The redwoodshare-count of the redwood stock is usually 20. The description of redwood stock is "Stock that you own that you can sell any number of. Type 'sell redwood stock' followed by the number you want to sell or 'puchase redwood stock' followed by the number you want to buy. You currently have [redwoodshare-count] redwood stock. They cost [redwood-price] dollars a share."

Phillip'sorange stock is a thing. It is in The Void. The printed name is "Phillip's Orange stock x [Phillip'sorangeshare-count]". Phillip'sorange stock has a number called Phillip'sorangeshare-count. Phillip'sorange stock has a number called Phillip'sorange-price. The Phillip'sorange-price of the Phillip'sorange stock is usually 200. The Phillip'sorangeshare-count of the Phillip'sorange stock is usually 100. The description of Phillip'sOrange stock is "Stock that you own that you can sell any number of. Type 'sell orange stock' followed by the number you want to sell or 'puchase orange stock' followed by the number you want to buy. You currently have [Phillip'sorangeshare-count] Orange stock. They cost [Phillip'sorange-price] dollars a share."

Phillip'sbackward stock is a thing. It is in The Void. The printed name is "Phillip's backward stock x [Phillip'sbackwardshare-count]". Phillip'sbackward stock has a number called Phillip'sbackwardshare-count. Phillip'sbackward stock has a number called Phillip'sbackward-price. The Phillip'sbackward-price of the Phillip'sbackward stock is usually 150. The Phillip'sbackwardshare-count of the Phillip'sbackward stock is usually 100. The description of Phillip'sbackward stock is "Stock that you own that you can sell any number of. Type 'sell backward stock' followed by the number you want to sell or 'puchase backward stock' followed by the number you want to buy. You currently have [Phillip'sbackwardshare-count] backward stock. They cost [Phillip'sbackward-price] dollars a share."

Phillip'sredwood stock is a thing. It is in The Void. The printed name is "Phillip's Redwood stock x [Phillip'sredwoodshare-count]". Phillip'sredwood stock has a number called Phillip'sredwoodshare-count. Phillip'sredwood stock has a number called Phillip'sredwood-price. The Phillip'sredwood-price of the Phillip'sredwood stock is usually 100. The Phillip'sredwoodshare-count of the Phillip'sredwood stock is usually 20. The description of Phillip'sredwood stock is "Stock that you own that you can sell any number of. Type 'sell Phillip'sredwood stock' followed by the number you want to sell or 'puchase redwood stock' followed by the number you want to buy. You currently have [Phillip'sredwoodshare-count] redwood stock. They cost [Phillip'sredwood-price] dollars a share."

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
		if player is in Phillip's Cubical:
			if Phillip'sComputer is 1:
				if the noun is Phillip'sorange stock:
					decrease the Phillip'sorangeshare-count of the Phillip'sOrange stock by the number understood;
					if the Phillip'sorangeshare-count of the Phillip'sorange stock is less than zero:
						increase the Phillip'sorangeshare-count by the number understood;
						say "You don't have that many stock to sell. You have [Phillip'sorangeshare-count] Orange stock.";
					otherwise:
						let C be the Phillip'sorange-price of the Phillip'sorange stock;
						let A be the number understood;
						let B be C * A;
						increase Phillip'sMoney by B;
						say "Now you have [Phillip'sOrangeshare-count] Orange stock and [Phillip'sMoney] dollars.";
				Otherwise:
					if the noun is Phillip'sbackward stock:
						decrease the Phillip'sbackwardshare-count of the Phillip'sbackward stock by the number understood;
						if the Phillip'sbackwardshare-count of the Phillip'sbackward stock is less than zero:
							increase the Phillip'sbackwardshare-count by the number understood;
							say "You don't have that many stock to sell. You have [Phillip'sbackwardshare-count] backward stock.";
						otherwise:
							let C be the Phillip'sbackward-price of the Phillip'sbackward stock;
							let A be the number understood;
							let B be C * A;
							increase Phillip'sMoney by B;
							say "Now you have [Phillip'sbackwardshare-count] backward stock and [Phillip'sMoney] dollars.";
					Otherwise:
						if the noun is Phillip'sredwood stock:
							decrease the Phillip'sredwoodshare-count of the Phillip'sredwood stock by the number understood;
							if the Phillip'sredwoodshare-count of the Phillip'sredwood stock is less than zero:
								increase the Phillip'sredwoodshare-count by the number understood;
								say "You don't have that many stock to sell. You have [Phillip'sredwoodshare-count] redwood stock.";
							otherwise:
								let C be the Phillip'sredwood-price of the Phillip'sredwood stock;
								let A be the number understood;
								let B be C * A;
								increase Phillip'sMoney by B;
								say "Now you have [Phillip'sredwoodshare-count] redwood stock and [Phillip'sMoney] dollars.";

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
				say "You don't have enough money.";
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
					say "You don't have enough money.";
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
						say "You don't have enough money.";
					otherwise:
						say "Now you have [redwoodshare-count] redwood stock and [Money] dollars.";
	Otherwise:
		if player is in Phillip's Cubical:
			if Phillip'sComputer is 1:
				if the noun is Phillip'sorange stock:
					increase the Phillip'sorangeshare-count of the Phillip'sOrange stock by the number understood;
					let C be the Phillip'sorange-price of the Phillip'sorange stock;
					let A be the number understood;
					let B be C * A;
					decrease Phillip'sMoney by B;
					if Money is less than zero:
						decrease the Phillip'sorangeshare-count by the number understood;
						increase Phillip'sMoney by B;
						say "You don't have enough money.";
					otherwise:
						say "Now you have [Phillip'sorangeshare-count] Orange stock and [Phillip'sMoney] dollars.";
				Otherwise:
					if the noun is backward stock:
						increase the Phillip'sbackwardshare-count of the Phillip'sbackward stock by the number understood;
						let C be the Phillip'sbackward-price of the Phillip'sbackward stock;
						let A be the number understood;
						let B be C * A;
						decrease Money by B;
						if Phillip'sMoney is less than zero:
							decrease the Phillip'sbackwardshare-count by the number understood;
							increase Phillip'sMoney by B;
							say "You don't have enough money.";
						otherwise:
							say "Now you have [Phillip'sbackwardshare-count] backward stock and [Phillip'sMoney] dollars.";
					Otherwise:
						if the noun is Phillip'sredwood stock:
							increase the Phillip'sredwoodshare-count of the Phillip'sredwood stock by the number understood;
							let C be the Phillip'sredwood-price of the Phillip'sredwood stock;
							let A be the number understood;
							let B be C * A;
							decrease Phillip'sMoney by B;
							if Money is less than zero:
								decrease the Phillip'sredwoodshare-count by the number understood;
								increase Phillip'sMoney by B;
								say "You don't have enough money.";
							otherwise:
								say "Now you have [Phillip'sredwoodshare-count] redwood stock and [Phillip'sMoney] dollars.";

[code for buying stocks created with a great deal of help from Mrs. Kiang]

Instead of examining Old Computer:
	if OldComputerState is 0:
		say "The computer is currently displaying your Boss's stock portfolio. It mainly consists of three stocks Orange, RedWood, and Backward. To your shock and dismay you realize that over the course of the last 10 minutes your Boss's portfolio has lost 10 percent equating to almost 13 million dollars. And the stocks' value are still plummeting. You'll have to act fast to save your clients. You try to remember how you Boss sold stocks. You think that he just typed sell or purchase, the stocks name, and the number of shares to buy or sell.";
	otherwise:
		say "A giant monitor rests upon your Boss's desk humming away.";

Corded Phone is scenery. It is in Boss's Cubical. The description is "The phone is currently dormant with no messages and there isn't anyone you really want to call right now."

Filling Cabinet is in Boss's Cubical. Filling Cabinet is an openable container. Filling Cabinet is lockable and locked. It is undescribed. The description is "This is where your Boss keeps all his records. Perhaps there may be something incriminating inside but you Boss has the key." Cabinet Key unlocks the Filling Cabinet.

Notes is a thing. It is in Filling Cabinet. The description is "You knew your Boss would be to lazy to cover his tracks. Scattered throughout the various files are notes from conversations with the employees of numerous companies talking about products before they had been publicly announced. These are most definitely illegal and more than enough to get your Boss arrested but maybe there won't be a need for that perhaps you should talk to him."

Desk is scenery. It is in Boss's Cubical. The description is "Made of plastic the desk is rather sparsely decorated only having a computer and phone sitting on top of it."

Boss carries cabinet key.

Phillip's Cubical is a room. It is east of Floor One Hallway. "Phillip's cubical while still small is significantly larger than yours. His computer is slightly less clunky than yours and has a stapler sitting next to it. Otherwise his office is mostly empty."

Phillip's Computer is scenery. It is in Phillip's Cubical. "[if Phillip'sComputer is 0] Phillip's Computer is currently locked with a password if you could find out what it is you could acsess his stocks. [otherwise if Phillip'sComputer is 1] Phillip is currently owns [Phillip'sOrange Stock] orange stocks, [Phillip'sRedWood Stock] Redwood Stocks, and [Phillip'sBackward Stock] Backward. He has [Phillip'sMoney] dollars."

Phillip's Stocks is scenery. It is in Phillip's Cubical. "[if Phillip'sComputer is 0] You can't see them because Phillip's Computer is currently locked. [otherwise if Phillip'sComputer is 1] Phillip is currently owns [Phillip'sOrange Stock] orange stocks, [Phillip'sRedWood Stock] Redwood Stocks, and [Phillip'sBackward Stock] Backward. He has [Phillip'sMoney] dollars."

Stapler is a thing. It is in Phillip's Cubical. It is undescribed. The description is "It's a standard utilitarian office stapler. There appears to be something sticking out from under the stapler."

Yellow Sticky Note is a thing. It is in Phillip's Cubical. It is undescribed. The description is "[Line Break]'Password:[Line Break] abcd1234'"

Instead of looking under Stapler:
	if player is not carrying Sticky Note:
		say "You find a yellow sticky note a fixed to the bottom of the stapler. It reads, 'Password:[Line Break] abcd1234'";
	Otherwise:
		if player is carrying Sticky Note:
			say "You already took the sticky note."

Floor One Hallway is a room. It is south of Boss's Cubical. "To the north is your Boss's cubical, to the east is Phillip's Cubical, and to the east if the elevator."

After going north from Floor One Hallway:
	If gamestate is 6:
		say "As you enter your cubical your phone begins to ring.";
	otherwise:
		move player to Boss's Cubical;

Floor One Elevator is a room. It is west of Floor One Hallway. "The company elevator is lined by decorative wooden paneling. A poster is a fixed to the wall directly across from the door and three buttons are just to the right of the door. They read Ground Floor, Floor One, and Floor Two. The exit is to the west."

Ground Floor Button is scenery. It is in Floor One Elevator. "The button has a large embroidered G on it."

Floor One Button is scenery. It is in Floor One Elevator. "The button has a large embroidered 1 on it."

Floor Two Button is scenery. It is in Floor One Elevator. "The button has a large embroidered 2 on it."

Poster is scenery. It is in Floor One Elevator. "The poster display's a giant bull Merrill Lynch's mascot with the subtext 'Be Bullish'."

Instead of pushing Ground Floor Button:
	say "You disinterestedly drum out a tattoo on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a bustling lobby.";
	move player to Lobby;
	move Ground Floor Button to Lobby Elevator;
	move Floor One Button to Lobby Elevator;
	move Floor Two Button to Lobby Elevator;
	move Poster to Lobby Elevator;
	
Instead of pushing Floor One Button:
	say "You disinterestedly drum out a tattoo on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a endless sea of cubicles.";
	move player to Floor One Hallway;
	move Ground Floor Button to Floor One Elevator;
	move Floor One Button to Floor One Elevator;
	move Floor Two Button to Floor One Elevator;
	move Poster to Floor One Elevator;
	
Instead of pushing Floor Two Button:
	say "You disinterestedly drum out a tattoo on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a expansive reception room.";
	move player to Reception;
	move Ground Floor Button to Floor Two Elevator;
	move Floor One Button to Floor Two Elevator;
	move Floor Two Button to Floor Two Elevator;
	move Poster to Floor Two Elevator;

Lobby is a room. It is west of Lobby Elevator. "The lobby is bustling with activity. Dozens of former employees are being escorted off company ground carrying their supplies in little cardboard boxes. To the south is a meeting room and north is a cafe."

[Code for Elevator]

Cafe is a room. It is north of Lobby. "This is where the less successful financial investors tend to meet their clients. [if gamestate is 3]"

Client is a woman. It is in the void. 

Instead of talking to Client:
	say "You could say: [if Client'sConversation is 0][Line break][bracket]1[close bracket]'Hello. How are you doing today?'[Line break][bracket]2[close bracket]'So why did you call me?'[otherwise if Client'sConversation is 1][Line break][bracket]3[close bracket]'When the stock market is in turmoil like it is now you have the chance to make much more than if it were stable. I have acsess to numerous charts ands projections created by our best analysts. Have no fear I will keep your money safe.'[Line break][Bracket]4[Close Bracket]'I'm going to make more of it.'[otherwise if Client'sConversation is 2][Line break][bracket]5[close bracket]'Redwood'[Line break][bracket]6[close bracket]'Orange'[Line break][bracket]7[close bracket]'Backward'";

Meeting Room is a room. It is south of Lobby. "The room is dominated by a by a large glass table placed squarely in the center of the room. In the front of the room is a projector screen and back to the north is the lobby."

After going south from Lobby for the first time:
	say "You are one of the last employees to file into the Meeting room. It's jam-packed containing more than 30 employees. Jonathan the senior official in this branch of Merrill Lynch laboriously clambers on top of the table to address everyone assembled. 'I think most of you know why we are here but in case you've been asleep for the past five hours I'll recap. The DOW just dropped 250 points in one day and our analysts predict it isn't going to get better for a very long time. Therefore, Merrill Lynch will not be able to keep all of you. He begins to rattle off a list of names and finally employee number 27?' Your Boss perks up and says, 'That would be me sir.' 'Ah of course well you can stay. Everyone else has 3 hours to pack and leave.' You can't afford to lose this job. It's the only thing paying your rent there must be some way to take your Boss's place after all it was you who saved his stocks. Perhaps there might be something in his office.";
	increase gamestate by 1;
	increase boss'sconversation by 1;
	move player to Meeting Room;

Large Glass Table is scenery. It is in Meeting Room. "On top of the table is today's newspaper."

Today's Newspaper is a thing. It is in Meeting Room. It is undescribed. The description is "The newspaper is almost entirely devoted to the stock market dropping. The second page reads, 'This is a not a minor event that's going to go away in a night. I expect orange's stock to keep dropping for the foreseeable future.'"

Lobby Elevator is a room. "The company elevator is lined by decorative wooden paneling. A poster is a fixed to the wall directly across from the door and three buttons are just to the right of the door. They read Ground Floor, Floor One, and Floor Two. The exit is to the west."

Floor Two Elevator is a room. "The company elevator is lined by decorative wooden paneling. A poster is a fixed to the wall directly across from the door and three buttons are just to the right of the door. They read Ground Floor, Floor One, and Floor Two. The exit is to the south."

Reception is a room. It is south of Floor Two Elevator. "This reception room is more lavish than any other portion of the building you have seen. Behind a marble desk sits an attendant. To the west is Jonathan Office."

Attendant is a woman. It is undescribed. It is in Reception. 

Instead of talking to Attendant:
	say "You could say: [if Attendant'sConversation is 0]You have nothing to say[otherwise if Attendant'sConversation is 1][Line break][bracket]1[close bracket]'May I speak Jonathan?'[Line break][bracket]2[close bracket]'Hello, how has your day been?'[Line break][otherwise if Attendant'sConversation is 2][bracket]3[close bracket]'Yes, he ask for me.'[Line break][bracket]4[close bracket]'Never mind.'[Line break][otherwise if Attendant'sConversation is 3][bracket]5[close bracket]'Well perhaps he has grown complacent and it's time for him to be replaced.'";

CEO Office is a room. It is west of CEO Door. "[If Jonathan is in CEO Office]Jonathan posses a beautiful office overlooking a stunning view. In the middle of the room is a wooden desk with a computer sitting on top of it. Jonathan stands behind the desk. [Otherwise] Jonathan posses a beautiful office overlooking a stunning view. In the middle of the room is a wooden desk with a computer sitting on top of it."

Antique Desk is scenery. It is in CEO Office. The description is "A beautiful wooden construction you are sure it was vey expensive."

New Computer is scenery. It is in CEO Office. The description is "[if TempCon is 2] The computer displays the folder Pictures and his Imgur account. The imgur account reads 'Put a photo in imgur to upload it.'[otherwise] The newest top of the line computer. Humms gently on the CEO's desk. The screen is currently obscured by a password lock."

Jonathan is a man. It is in CEO Office. It is undescribed. The description is "Dressed in a designer suit and wearing a Rolex it is evident that Jonathan has prospered much more than most others."

Instead of talking to Jonathan:
	If IHack is 0:
		increase TheEnd by 3;
	Otherwise:
		If IHack is 1:
			If PhilipHack is 1:
				increase TheEnd by 5;
			otherwise:
				increase TheEnd by 4;
	
Every Turn:
	if TheEnd is 1:
		end the story finally saying "'Who is this?' you ask. 'It's Jonathan again. You have had your four days. Your performance has been unsatisfactory. We are going to replace you with another.' he says.";
	otherwise:
		if TheEnd is 2:
			end the story finally saying "'Who is this?' you ask. 'It's Jonathan again. You have had your four days. All things considered you have done ok. But I decided you need to be replaced with someone more qualified.' he says.";
		otherwise:
			if TheEnd is 3:
				End the story finally saying "'Hello sir.' you say. 'It's nice to see you. I have been looking at your progress over the past four days. I must say you have done very well. I'm impressed. I think you will make a fine broker better than we could hire right now. We are keeping you on.'";
			otherwise:
				if TheEnd is 4:
					End the story finally saying "'Hello sir.' you say. 'It's nice to see you. I have been looking at your progress over the past four days. I must say you have done very well. I'm impressed. I think you will make a fine broker better than we could hire right now. We are keeping you on.' Just as Jonathan finished talking his cellphone started to ring. 'Excuse me for a moment. Hello. Yes this is Jonathan. What! No! I never did that! Here he is.' He hands the phone to you. 'Hello I'm Andrew head of Merrill Lynch's Board of Directors. Jonathan uploaded some obscene photos and the media are having field day. So he is going to be fired to save face. We would have appointed you but another broker Philip has out performed you.'";
				otherwise:
					if TheEnd is 5:
						End the story finally saying "'Hello sir.' you say. 'It's nice to see you. I have been looking at your progress over the past four days. I must say you have done very well. I'm impressed. I think you will make a fine broker better than we could hire right now. We are keeping you on.' Just as Jonathan finished talking his cellphone started to ring. 'Excuse me for a moment. Hello. Yes this is Jonathan. What! No! I never did that! Here he is.' He hands the phone to you. 'Hello I'm Andrew head of Merrill Lynch's Board of Directors. Jonathan uploaded some obscene photos and the media are having field day. So he is going to be fired to save face. We the board has decided to appoint you acting CEO.'";

Pictures Folder is a container. It is openable. It is fixed in place. It is in the void. The description is "This is where Jonathan keeps his Photos"

Obscene Photos is a thing. It is in Pictures Folder. The description is "You find a couple photos that you are sure Jonathan wouldn't be proud of."

Imgur is a container. It is in the void. It is fixed in place. It is undescribed. The description is "The imgur account reads 'Put a photo in imgur to upload it.'"

Call Card is a thing. It is in the void. The description is "Financial Analyst for Hire [line break] Contact us at '123-4567'"

Password Card is a thing. It is in the void. It is undescribed. The description is "The card reads, 'Jonathan is the best'"

CEO Door is west of the Reception and east of the CEO Office. CEO Door is a door. CEO Door is scenery. CEO Door is lockable and locked. 

The Void is a room.

[sell orange stock 100]
[sell backward stock 100]
[sell redwood stock 20]
[s]
[w]
[push ground floor button]
[s]
[x newspaper]
[n]
[e]
[push floor one button]
[n]
[buy backward stock 246]
[buy redwood stock 1]
[go home]
[n]
[talk to client]
[2]
[4]
[s]
[e]
[push floor one button]
[n]
[talk to boss]
[1]
[3]
[unlock filling cabinet with cabinet key]
[take notes]
[talk to boss]
[4]
[sell backward stock 246]
[buy redwood stock 447]
[go home]
[s]
[e]
[push floor one button]
[n]
[x call card]
[sell redwood stock 36]
[call 123-4567]
[1]
[go home]
[s]
[e]
[push floor one button]
[n]
[sell redwood stock 412]
[buy orange stock 733]
[go home]
[s]
[e]
[push floor one button]
[n]
[answer phone]
[sell orange stock 733]
[answer phone]
[s]
[w]
[push floor two button]
[talk to attendant]
[2]
[5]
[w]
[x password card]
[type jonathan is the best]
[take obscene photos]
[put obscene photos in Imgur]
[talk to jonathan]
