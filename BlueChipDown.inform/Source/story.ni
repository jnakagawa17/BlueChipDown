"BlueChipDown" by Jonathan Nakagawa

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

A person has a table name called conversation.
Instead of asking someone about something: 
    let the source be the conversation of the noun; 
    if topic understood is a topic listed in source: 
        if there is a turn stamp entry: 
            say "[The noun] has already told you that [summary entry]."; 
        otherwise: 
            now turn stamp entry is the turn count; 
            say "[reply entry][paragraph break]"; 
    otherwise: 
        say "[The noun] stares at you blankly."

Definition: a person is other if it is not the player.
Understand "recap" or "recall" or "review" as recalling conversations.
Recalling conversations is an action applying to nothing.

Carry out recalling conversations: 
    repeat with speaker running through other people: 
        let source be the conversation of the speaker; 
        sort source in turn stamp order; 
        say "[The speaker] has so far told you: [line break]"; 
        let index be 0; 
        repeat through source: 
            if there is a turn stamp entry: 
                let index be 1; 
                say " [summary entry][line break]"; 
        if index is 0, say " absolutely nothing[line break]"; 
        say conditional paragraph break.

Boss's Cubical is a room. 

Boss is a man in Boss's Cubical. The conversation of Boss is the Table of Boss's Chatter. 

Old Computer is scenery. It is in Boss's Cubical.

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

Ground Floor Button is scenery. It is in Floor One Elevator.

Floor One Button is scenery. It is in Floor One Elevator.

Floor Two Button is scenery. It is in Floor One Elevator.

Floor Three Button is scenery. It is in Floor One Elevator.

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