# Desc: Bele veziyyetin icine soxum

def open_file(file_path):
    try:
        with open(file_path, 'r') as file:
            first_line = file.readline().strip()
            print(first_line)
    except Exception as e:
        print(f"An error occurred while reading the file: {e}")
    return first_line

def write_report(file_path, report):
    try:
        with open(file_path, 'w') as file:
            file.write(report)
    except Exception as e:
        print(f"An error occurred while writing the file: {e}")
