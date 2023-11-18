receive() external payable {
  require(msg.value >= prize || msg.sender == owner);
  king.transfer(msg.value);
  king = msg.sender;
  prize = msg.value;
}
