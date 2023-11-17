from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()

client = OpenAI()

def read_file(file_path):
    try:
        with open(file_path, 'r') as file:
            return file.read()
    except Exception as e:
        print(f"An error occurred while reading the file: {e}")
        return None
    
def write_report(file_path):
    report = client.chat.completions.create(
  model="gpt-4",
  messages=[
    {"role": "system", "content": "Analyze and explain the vulnerabilities in this solidity code:"},
    {"role": "user", "content": read_file(file_path)},
  ]
)
    try:
        with open("./report.txt", 'w') as file:
            file.write(str(report.choices[0].message.content))
    except Exception as e:
        print(f"An error occurred while writing the file: {e}")
        return None
