part of dotdotcommadot_messaging_test;

messagingTestCase()
{
	IMessageDispatcher messageDispatcher;
	const Symbol STUFF_HAPPENING = const Symbol("stuffHappening");
	
	setUp(() 
	{
		messageDispatcher = new CentralDispatcher();	
	});
	
	tearDown(() 
	{
		messageDispatcher = null;
	});
	
	test('Messaging', () 
	{
		Function callback = expectAsync((Message message){ }, count: 1);
		
		messageDispatcher.addListener(STUFF_HAPPENING, callback);
		messageDispatcher.send(STUFF_HAPPENING);
	});

	test('Messaging Data', () 
	{
		Function callback = (Message message){ expect(message.data, equals(" Message One")); };
		
		messageDispatcher.addListener(STUFF_HAPPENING, callback);
		messageDispatcher.send(STUFF_HAPPENING, " Message One");
	});
}