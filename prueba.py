import hashlib

texto = "1234"

# Convertir a bytes y generar hash SHA-256
hash_obj = hashlib.sha256(texto.encode())

# Obtener resultado hexadecimal
resultado = hash_obj.hexdigest()

print(resultado)
