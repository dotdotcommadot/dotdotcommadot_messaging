part of dotdotcommadot_messaging;

abstract class MessageDispatcherMixin
{
	//-----------------------------------
	//
	// Private Properties
	//
	//-----------------------------------
	
	final Map<Symbol, MessageMapping> _messageMappings = new Map();
	
	//-----------------------------------
	//
	// Public Methods
	//
	//-----------------------------------
	
	/**
	 * Dispatches a message
	 */
	void sendMessage(Symbol name, [dynamic data = null])
	{
	  final MessageMapping messageMapping = _messageMappings[name];
	  
	  if (messageMapping != null)
	    messageMapping.send(data);
	}
	
	/**
	 * Adds callback to this dispatcher for a given [name]
	 */
	void addMessageListener(Symbol name, MessageHandlerFunction handler, [int order = 0])
	{
	  if (_messageMappings[name] != null)
	    _addHandlerToMapping(_messageMappings[name], handler, order);
	  else
	    _setupMapping(name, handler, order);
	}
	
	/**
	 * Removes callback from dispatcher for a given [name]
	 */
	void removeMessageListener(Symbol name, MessageHandlerFunction handler)
	{
	  if (_messageMappings[name] != null)
	    _removeHandlerFromMapping(_messageMappings[name], handler);
	}
	
	/**
	 * Removes all callbacks from dispatcher for a given [name]
	 */
	void removeAllMessageListeners(Symbol name)
	{
	  _messageMappings.remove(name);
	}
	
	/**
	 * Checks if someone is listening for messages on a certain [name]
	 */
	bool hasMessageListener(Symbol name)
	{
	  return _messageMappings[name] != null;
	}
	
	/**
	 * Cancels dispatching for a given message [name] just once.
	 * If you wish to cancel all future messages, use [removeAllMessageListeners] instead.
	 */
	void cancelMessage(Symbol name)
	{
	  final MessageMapping messageMapping = _messageMappings[name];
	  messageMapping.cancel();
	}
	
	//-----------------------------------
	//
	// Private Methods
	//
	//-----------------------------------
	
	void _addHandlerToMapping(MessageMapping mapping, MessageHandlerFunction handler, [int order = 0])
	{
		if (!mapping.hasHandler(handler))
			mapping.addHandler(handler, order);
	}
	
	void _removeHandlerFromMapping(MessageMapping mapping, MessageHandlerFunction handler)
	{
	  mapping.removeHandler(handler);
	  if (!mapping.hasHandlers)
	    _messageMappings.remove(mapping);
	}
	
	void _setupMapping(Symbol name, MessageHandlerFunction handler, [int order = 0])
	{
	  final MessageMapping mapping = new MessageMapping();
	  mapping.addHandler(handler, order);
	  _messageMappings[name] = mapping;
	}
}