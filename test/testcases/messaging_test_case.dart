part of dotdotcommadot_messaging_test;

messagingTestCase()
{
	MessageDispatcher messageDispatcher;
	const Symbol STUFF_HAPPENING = const Symbol("stuffHappening");
	
	setUp(() 
	{
		messageDispatcher = new MessageDispatcher();	
	});
	
	tearDown(() 
	{
		messageDispatcher = null;
	});
	
	test('Messaging', () 
	{
		Function callback = expectAsync((Message message){ }, count: 1);
		
		messageDispatcher.addMessageListener(STUFF_HAPPENING, callback);
		messageDispatcher.sendMessage(STUFF_HAPPENING);
	});

	test('Messaging Data', () 
	{
		Function callback = (Message message){ expect(message.data, equals(" Message One")); };
		
		messageDispatcher.addMessageListener(STUFF_HAPPENING, callback);
		messageDispatcher.sendMessage(STUFF_HAPPENING, " Message One");
	});
}