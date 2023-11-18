  function Fal1out() public payable {
    owner = msg.sender;
    allocations[owner] = msg.value;
  }