part of dotdotcommadot_messaging;

typedef void MessageHandlerFunction(Message message);

class MessageHandler
{
  //-----------------------------------
  //
  // Public Properties
  //
  //-----------------------------------
	
  //-----------------------------------
  // Handler
  //-----------------------------------
	
	MessageHandlerFunction handler;

  //-----------------------------------
  // Order
  //-----------------------------------
	
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
	
	void call(dynamic data)
	{
		handler(new Message(const Symbol(""), this, order, data));
	}
}