import hashlib

# get password from user
password = input("Enter your password: ")

# adding additional data as salt
salt = "mohamed"
  
# Adding salt at the last of the password
dataBase_password = password+salt
# Encoding the password
hashed = hashlib.md5(dataBase_password.encode())
  
# Printing the Hash
print(hashed.hexdigest())
