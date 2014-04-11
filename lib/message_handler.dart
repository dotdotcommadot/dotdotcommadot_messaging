part of dotdotcommadot_messaging;

typedef void MessageHandlerFunction(dynamic data);

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
		Function.apply(handler, [data]);
	}
}