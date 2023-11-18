uint256 blockValue = uint256(blockhash(block.number.sub(1)));

if (lastHash == blockValue) {
    revert();
}

lastHash = blockValue;
uint256 coinFlip = blockValue.div(FACTOR);
bool side = coinFlip == 1 ? true : false;