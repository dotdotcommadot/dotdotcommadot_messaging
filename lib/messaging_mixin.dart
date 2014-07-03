part of dotdotcommadot_messaging;

abstract class MessagingMixin
{
	final MessageDispatcher messageDispatcher = new MessageDispatcher();
	
	void sendMessage(Symbol name, [dynamic data])
	{
		messageDispatcher.send(name, data);
	}

	void addMessageListener(Symbol name, MessageHandlerFunction handler, [int order = 0])
	{
		messageDispatcher.addListener(name, handler, order);
	}
	
	void removeMessageListener(Symbol name, Function handler)
	{
		messageDispatcher.removeListener(name, handler);
	}
  	
	void removeAllMessageListeners(Symbol name)
	{
		messageDispatcher.removeAllListeners(name);
	}
	
	bool hasMessageListener(Symbol name)
	{
		return messageDispatcher.hasListener(name);
	}

	void cancelMessage(Symbol name)
	{
		messageDispatcher.cancel(name);
	}
}