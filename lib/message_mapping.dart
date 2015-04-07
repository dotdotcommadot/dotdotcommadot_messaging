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
	
	bool hasHandler(MessageHandlerFunction handler) => _handlers.where((H) => H.handler == handler).length > 0;
	
	void addHandler(MessageHandlerFunction handler, [int order = 0])
	{
		_handlers.add(new MessageHandler(handler, order));
		_handlers.sort((MessageHandler x, MessageHandler y) => x.order.compareTo(y.order));
	}
	
	void removeHandler(Function handler)
	{
		_handlers.remove(handler);
	}
	
	void send(dynamic data)
	{
		_handlers.forEach((MessageHandler handler)
		{
			if (!_isCancelled)
				handler.call(data);
		});
		
		_isCancelled = false;
	}
	
	void cancel()
	{
		_isCancelled = true;
	}
}