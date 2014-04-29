part of dotdotcommadot_messaging;

class MessageError extends Error
{
	//-----------------------------------
  //
  // Public Properties
  //
  //-----------------------------------
	
	final String message;
	
	//-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
	
	MessageError([this.message = ""]);
      
	//-----------------------------------
  //
  // Public Methods
  //
  //-----------------------------------
	
  String toString() 
  {
    if (message != null) 
      return "Message Error: $message";

    return "Message Error";
  }
}