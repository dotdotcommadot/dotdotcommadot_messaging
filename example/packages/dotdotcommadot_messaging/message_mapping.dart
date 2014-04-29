part of dotdotcommadot_messaging;

class MessageMapping
{
  //-----------------------------------
  //
  // Private Properties
  //
  //-----------------------------------
	
	List<MessageHandler> _handlers = new List<MessageHandler>();

	bool _isCancelled = false;
	
  //-----------------------------------
  //
  // Public Properties
  //
  //-----------------------------------
	
	bool get hasHandlers => (_handlers != null) && _handlers.length > 0;
	
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
	
	MessageMapping();
	
  //-----------------------------------
  //
  // Public Methods
  //
  //-----------------------------------
	
	addHandler(MessageHandlerFunction handler, [int order = 0])
	{
		_handlers.add(new MessageHandler(handler, order));
		_handlers.sort((MessageHandler x, MessageHandler y) => x.order.compareTo(y.order));
	}
	
	removeHandler(Function handler)
	{
		_handlers.remove(handler);
	}
	
	send(dynamic data)
	{
		_handlers.forEach((MessageHandler handler)
		{
			if (!_isCancelled)
				handler.call(data);
		});
		
		_isCancelled = false;
	}
	
	cancel()
	{
		_isCancelled = true;
	}
}