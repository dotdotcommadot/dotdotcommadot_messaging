part of dotdotcommadot_messaging;

class MessageDescriptor
{
  //-----------------------------------
  //
  // Public Properties
  //
  //-----------------------------------
  
  Symbol _name;
  Symbol get name => _name;

  dynamic _target;
  dynamic get target => _target;
  
  int _order;
  int get order => _order;

  dynamic _data;
  dynamic get data => _data;
  
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
  
  MessageDescriptor(this._name, this._target, this._order, [this._data = null]);
}