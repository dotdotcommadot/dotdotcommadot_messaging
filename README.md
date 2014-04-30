# dotdotcommadot Messaging

###### Version: 0.0.1 -- alpha

## About

dotdotcommadot Messaging is a light-weight messaging system.
Google Dart comes with Streams and Futures for async operations, which are both very strong, but they bring a lot of overhead if all you need is 
an application-global observer system, such as an eventbus, or centralised notifications.
This framework brings a very simple API for doing just that.

## Simple Example

	// The name of the message
	const Symbol STUFF_HAPPENING = const Symbol("stuffHappening");

	// The dispatcher
	IMessageDispatcher messageDispatcher = new MessageDispatcher();
	
	// Adding listeners
	messageDispatcher.addListener(STUFF_HAPPENING, onStuffHappening);
	
	// Dispatching the message with its data
	messageDispatcher.send(STUFF_HAPPENING, " message 1");
	
	// the listening function
	void onStuffHappening(Message message)
	{
		print("Stuff Happening" + message.data.toString()); // Prints: 'Stuff Happening message 1'
	}
	
For more possibilities, have a look in the 'example' directory.

## Info
	
For more info about this project, contact:

- [hans@dotdotcommadot.com](mailto:hans@dotdotcommadot.com)
