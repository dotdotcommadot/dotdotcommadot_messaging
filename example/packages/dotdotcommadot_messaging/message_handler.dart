part of dotdotcommadot_messaging;

typedef void MessageHandlerFunction({Message message});

class MessageHandler
{
  //-----------------------------------
  //
  // Public Properties
  //
  //-----------------------------------
	
	MessageHandlerFunction handler;

	int order = 0;
	
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
	
	MessageHandler(this.handler, this.order);
	
  //-----------------------------------
  //
  // Public Methods
  //
  //-----------------------------------
	
	call(dynamic data)
	{
		handler(message: new Message(new Symbol(""), this, order, data));
	}
}