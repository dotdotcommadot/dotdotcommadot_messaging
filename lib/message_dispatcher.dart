part of dotdotcommadot_messaging;

class MessageDispatcher implements IMessageDispatcher
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
  
  void send(Symbol name, [dynamic data = null])
  {
    final MessageMapping messageMapping = _messageMappings[name];
    
    if (messageMapping != null)
      messageMapping.send(data);
  }
  
  void addListener(Symbol name, MessageHandlerFunction handler, [int order = 0])
  {
    if (_messageMappings[name] != null)
      _addHandlerToMapping(_messageMappings[name], handler, order);
    else
      _setupMapping(name, handler, order);
  }
  
  void removeListener(Symbol name, MessageHandlerFunction handler)
  {
    if (_messageMappings[name] != null)
      _removeHandlerFromMapping(_messageMappings[name], handler);
  }
  
  void removeAllListeners(Symbol name)
  {
    _messageMappings.remove(name);
  }
  
  bool hasListener(Symbol name)
  {
    return _messageMappings[name] != null;
  }
  
  void cancel(Symbol name)
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
  
  void _removeHandlerFromMapping(MessageMapping mapping, Function handler)
  {
    mapping.removeHandler(handler);
    if (!mapping.hasHandlers)
      _messageMappings.remove(mapping);
  }
  
  void _setupMapping(Symbol name, Function handler, [int order = 0])
  {
    final MessageMapping mapping = new MessageMapping();
    mapping.addHandler(handler, order);
    _messageMappings[name] = mapping;
  }
}