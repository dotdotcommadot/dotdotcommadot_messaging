part of dotdotcommadot_messaging;

class Message
{
  //-----------------------------------
  //
  // Public Properties
  //
  //-----------------------------------
  
  final Symbol name;

  final dynamic target;
  
  final int order;

  final dynamic data;
  
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
  
  Message(this.name, this.target, this.order, [this.data = null]);
}