part of dotdotcommadot_messaging;

abstract class MessagingMixin implements IMessageDispatcher
{
	MessageDispatcher messageDispatcher;
	
	void send(Symbol name, [dynamic data])
	{
		messageDispatcher.send(name, data);
	}

	void addListener(Symbol name, MessageHandlerFunction handler, [int order = 0])
	{
		messageDispatcher.addListener(name, handler, order);
	}
	
	void removeListener(Symbol name, Function handler)
	{
		messageDispatcher.removeListener(name, handler);
	}
  	
	void removeAllListeners(Symbol name)
	{
		messageDispatcher.removeAllListeners(name);
	}
	
	bool hasListener(Symbol name)
	{
		return messageDispatcher.hasListener(name);
	}

	void cancel(Symbol name)
	{
		messageDispatcher.cancel(name);
	}
}