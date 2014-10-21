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

[taken from http://www.musicwords.net/if/InformHandbook.pdf chapter 9]

The description of player is "[if GameState is 0] After getting out of college strapped to cripling debt you couldn't afford much more than a couple second hand dress shirts and an imitation watch."

Boss's Cubical is a room. "Perhaps this room, if it can even be called a room, is the reason your Boss is constantly angry. Barely large enough for you to take a step in any direction everything is within easy arms reach. Not that there is much here an old computer sitting on a desk, a filling cabinet, and corded phone."

Boss is a man in Boss's Cubical.  "From day to day your Boss never seem change his appearence. He must own at least a dozen of the same set of plain clothes. Whenever he sees you his face turns a deep beetroot red and he seems to inflate."

Old Computer is scenery. It is in Boss's Cubical.

[Global:] OldComputerState is a number that varies. GameState is 0.

Corded Phone is scenery. It is in Boss's Cubical.

Filling Cabinet is a container. It is in Boss's Cubical.

Jonah's Cubical is a room. It is east of Floor One Hallway.

Jonah's Computer is scenery. It is in Jonah's Cubical.

Brittney's Cubical is a room. It is south of Floor One Hallway.

Brittney's Computer is scenery. It is in Brittney's Cubical.

Floor One Hallway is a room. It is south of Boss's Cubical.

Floor One Elevator is a room. It is west of Floor One Hallway.

Avery's Office is a room. It is northeast of Floor Two Hallway.

Erik's Office is a room. It is east of Floor Two Hallway.

Jonathan's Office is a room. It is north of Floor Two Hallway.

Andrew's Office is a room.  

Meeting Room is a room.

Floor Two Hallway is a room. It is east of Floor Two Elevator.

Floor Two Elevator is a room. 

Ground Floor Button is scenery. It is in Floor One Elevator. "The button has a large embrodered G on it."

Floor One Button is scenery. It is in Floor One Elevator. "The button has a large embrodered 1 on it."

Floor Two Button is scenery. It is in Floor One Elevator. "The button has a large embrodered 2 on it."

Floor Three Button is scenery. It is in Floor One Elevator. "The button has a large embrodered 3 on it."

[Code for Elevator]

Instead of pushing Ground Floor Button:
	move player to Lobby;
	move Ground Floor Button to Lobby Elevator;
	move Floor One Button to Lobby Elevator;
	move Floor Two  Button to Lobby Elevator;
	move Floor Three Button to Lobby Elevator;
	say "You disintrestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a bustling lobby.";
	
Instead of pushing Floor One Button:
	move player to Floor One Hallway;
	move Ground Floor Button to Floor One Elevator;
	move Floor One Button to Floor One Elevator;
	move Floor Two  Button to Floor One Elevator;
	move Floor Three Button to Floor One Elevator;
	say "You disintrestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a endless sea of cubicals.";
	
Instead of pushing Floor Two Button:
	move player to Floor Two Hallway;
	move Ground Floor Button to Floor Two Elevator;
	move Floor One Button to Floor Two Elevator;
	move Floor Two  Button to Floor Two Elevator;
	move Floor Three Button to Floor Two Elevator;
	say "You disintrestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a quiet hallway flanked by offices.";
	
Instead of pushing Floor Three Button:
	move player to Reception;
	move Ground Floor Button to Floor Three Elevator;
	move Floor One Button to Floor Three Elevator;
	move Floor Two  Button to Floor Three Elevator;
	move Floor Three Button to Floor Three Elevator;
	say "You disintrestedly drum out a tatto on the posters wooden frame waiting for the elevator's door to ding open. Finally you step out into a expansive reception room.";

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

Reception is a room. It is south of Floor Three Elevator.

Board Room is a room. It is east of Reception.

CEO Office is a room. It is west of Reception. 

Floor Three Elevator is a room.



A subject is a kind of thing. Some subjects are defined by the Table of Conversation Subjects.

Table of Conversation Subjects
subject	conversation
Evidence 	Table of evidence Queries
employment	Table of Job Queries

Instead of talking to Boss:
	say "You could say: [line break][bracket]1[close bracket]: hello how are you?";

Understand "job" as employment.

Table of Job Queries
quip	discussion	label	subtopics
"whether there is a job available here"	"'Say, are you hiring?' you ask, as casually as you can manage. [The interlocutor] looks you over dubiously. 'I might be hiring someone, but I can't say it would necessarily be you.'"	0	--
"what happened to that boy that worked here"	"'Tell me, didn't you used to have a young assistant working here?' She shrugs. 'Young men these days are so unstable. He left-- who knows where he's gone? I haven't seen hair or fingernail of him for weeks.'"	0	--
with 3 blank rows.

Table of Evidence Queries
quip	discussion	label	subtopics
"what pie fillings are available"	"'What pies do you have in today, Mrs Lovett?' you ask. She starts, then smiles. 'Meat pies, of course.'"	0	Table of Evidence Flavor Queries
with 3 blank rows.

Table of Evidence Flavor Queries
quip	discussion	label	subtopics
"what kind of meat"	"'What kind of meat goes into these pies, Mrs Lovett?' you ask pressingly. She looks shifty. 'Whatever the butcher brings this week,' she says. 'With the price of meat what it is, when you get it, you have to be glad of what you can get. If you get it.'"	0	--

To copy (first table - a table name) to (second table - a table name):
	repeat through first table:
		let copied quip be "blank";
		if there is a quip entry, now the copied quip is the quip entry;
		let copied discussion be "blank";
		if there is a discussion entry, now the copied discussion is the discussion entry;
		let copied subtopics be second table;
		if there is a subtopics entry, now the copied subtopics are the subtopics entry;
		choose a blank row in the second table;
		if copied quip is not "blank", now quip entry is copied quip;
		if copied discussion is not "blank", now discussion entry is copied discussion;
		if copied subtopics is not second table, now subtopics entry is copied subtopics.

Current conversation table is a table name that varies. Current conversation table is Table of Job Queries.

Interlocutor is a person that varies.

Understand "ask [someone] about [any subject]" as asking it about the subject.

Asking it about the subject is an action applying to two visible things.

Carry out asking it about the subject:
	say "You can't think of anything to say."

Instead of asking someone about the subject a subject listed in the Table of Conversation Subjects:
	now interlocutor is noun;
	now current conversation table is the conversation of the second noun;
	if the number of filled rows in the current conversation table is 1:
		repeat through current conversation table:
			now label entry is 1;
		now number understood is 1;
		try selecting 1 instead;
	if the number of filled rows in the current conversation table is 0:
		say "You can think of nothing further to say on that topic.";
		stop the action;
	otherwise:
		let index be 0;
		let total be the number of filled rows in the current conversation table;
		say "Do you mean ";
		repeat through current conversation table:
			now index is index + 1;
			now label entry is index;
			say "([index]) [quip entry]";
			if index is total, say "?";
			if index is total - 1, say ", or ";
			if index is less than total - 1, say ", ".

Understand "[number]" as selecting.

Selecting is an action applying to one number.

Carry out selecting:
	say "No such option is available."

Instead of selecting a label listed in the current conversation table:
	say "[discussion entry][paragraph break]";
	if there is a subtopics entry:
		copy subtopics entry to current conversation table;
	choose row with label of number understood in the current conversation table;
	blank out the whole row.

