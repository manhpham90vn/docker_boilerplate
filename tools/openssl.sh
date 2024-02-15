# Generate private key
openssl genrsa -out private.pem 2048

# Derive public key from private key
openssl rsa -in private.pem -pubout -out public.pem

# Encrypt Data
openssl rsautl -encrypt -inkey public.pem -pubin -in data.txt -out data.txt.enc

# Decrypt Data
openssl rsautl -decrypt -inkey private.pem -in data.txt.enc -out data.txt