from dotenv import load_dotenv
from zurnai.audit_file import open_file, write_report

load_dotenv()

write_report("./result.txt",open_file("zurnai/audit_file.py"))

