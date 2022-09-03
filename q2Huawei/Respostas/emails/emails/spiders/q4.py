import os.path, time

# Path to visualize what's inside the Directory
path = r"C:\Users\brand\OneDrive\Imagens\Fotos"

# List of all files only in the given directory
files = lambda x: os.path.isfile(os.path.join(path, x))

files_list = filter(files, os.listdir(path))

# List of files in directory along with the size
size_of_file = [
    (f, os.stat(os.path.join(path, f)).st_size) # Iterate the list of files along with size, print them and them I can call sorted
    for f in files_list                         # function to sort according to the size of the file
]

# Here we take the files in the directory and sort by his sizes
files = lambda x: x[1]

# In this case we have its file path instead of file
for f, s in sorted(size_of_file, key=files):
    print("{} |Size--> {}MB ".format(os.path.join(path, f), round(s / (1024 * 1024), 3)))
    print("Last modification: %s" % time.ctime(os.path.getmtime(path)))