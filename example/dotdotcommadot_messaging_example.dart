import "package:dotdotcommadot_messaging/dotdotcommadot_messaging.dart";

const Symbol STUFF_HAPPENING 	= const Symbol("stuffHappening");
const Symbol STUFF_TO_TELL 		= const Symbol("stuffToTell");
const Symbol STUFF_TO_DO 			= const Symbol("stuffToDo");

IMessageDispatcher messageDispatcher = new CentralDispatcher();

void main()
{
	messageDispatcher.addListener(STUFF_HAPPENING, onFirstHappening, 1);
	messageDispatcher.addListener(STUFF_HAPPENING, onSecondStuffHappening, 2);
	messageDispatcher.send(STUFF_HAPPENING, " message 1");

	messageDispatcher.addListener(STUFF_TO_TELL, onStuffToTell);
	messageDispatcher.addListener(STUFF_TO_TELL, onOtherStuffToTell);
	messageDispatcher.send(STUFF_TO_TELL, " message 2");
	
	messageDispatcher.removeListener(STUFF_HAPPENING, onSecondStuffHappening);
	messageDispatcher.send(STUFF_HAPPENING, " message 3");
	
	messageDispatcher.addListener(STUFF_TO_DO, onFirstStuffToDo, 1);
	messageDispatcher.addListener(STUFF_TO_DO, onSecondStuffToDo, 2);
	messageDispatcher.addListener(STUFF_TO_DO, onCancelledStuffToDo, 3);
	messageDispatcher.send(STUFF_TO_DO, " message 4");
	messageDispatcher.send(STUFF_TO_DO, " message 5");
	
	messageDispatcher.removeAllListeners(STUFF_HAPPENING);
	messageDispatcher.removeAllListeners(STUFF_TO_TELL);
	messageDispatcher.removeAllListeners(STUFF_TO_DO);

	messageDispatcher.send(STUFF_HAPPENING, " message 5");
	
	messageDispatcher.addListener(STUFF_HAPPENING, onFirstHappening, 1);
	
	messageDispatcher.send(STUFF_HAPPENING, " message 5");
}

void onFirstHappening(Message message)
{
	print("Stuff Happening" + message.data.toString());
}

void onSecondStuffHappening(Message message)
{
	print("Other Stuff Happening" + message.data.toString());
}

void onStuffToTell(Message message)
{
	print("Stuff To Tell");
}

void onOtherStuffToTell(Message message)
{
	print("Other Stuff To Tell" + message.data.toString());
}

void onFirstStuffToDo(Message message)
{
	print("First Stuff To Do" + message.data.toString());
}

void onSecondStuffToDo(Message message)
{
	print("Second Stuff To Do" + message.data.toString());
	messageDispatcher.cancel(STUFF_TO_DO);
}

void onCancelledStuffToDo(Message message)
{
	print("Cancelled Stuff To Do" + message.data.toString());
}