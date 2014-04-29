part of dotdotcommadot_messaging;

abstract class IMessageDispatcher
{
  //-----------------------------------
  //
  // Public Methods
  //
  //-----------------------------------
	
	void send(Symbol name, [dynamic data = null]);
	
	void addListener(Symbol name, Function handler, [int order = 0]);
	
	void removeListener(Symbol name, Function handler);
	
	void cancel(Symbol name);

	void close(Symbol name);
}