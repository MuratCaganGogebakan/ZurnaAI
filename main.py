import os
from dotenv import load_dotenv
from zurnai.audit_file import write_report
from zurnai.source_finder import EtherscanAPI

load_dotenv()

write_report("./testCode.sol")

# source_finder = EtherscanAPI(os.getenv('ETHERSCAN_API_KEY'), "mainnet")
# print(source_finder.get_source_code("0xcD35E248168665A255243f819a2D534c034C142f"))