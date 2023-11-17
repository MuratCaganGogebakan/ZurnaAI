from dotenv import load_dotenv
from zurnai.audit_file import write_report

load_dotenv()

write_report("./testCode.sol")

