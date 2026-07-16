import zipfile
import os

# Define your Windows file paths (Notice the 'r' before the string to handle Windows backslashes)
zip_path = r"C:\Users\PC\Downloads\training_set.zip" 
extract_path = r"C:\Users\PC\Downloads\training_set"

# Extract the zip file
with zipfile.ZipFile(zip_path, 'r') as zip_ref:
    zip_ref.extractall(extract_path)
    
print("Extraction complete!")
