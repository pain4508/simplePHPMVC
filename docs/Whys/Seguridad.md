# El esquema de Seguridad de un Comercio Electrónico
```
username, userpassword

select * from usuarios where username = ? and userpassword= ?;
```
## NO SE DEBE HACER
Pierdo información 

Bac Online 
```
  select * from usuarios where username=?;
```
valido el estado actual del usuario
intentos fallidos
verificacion de la contraseña
md5 XXXXXXXXX
sha256 > salting
bloqueo
store procedures
Base Datos 
Logica de Negocios 


sha256(12345678) ==> afdb18390a0c37cbfed

array('asdf','agd','asdf','a33f','23ra','asdf');

Time Based Salting
2018-11-20-19:26:45 -- utlima modificación de contraseña
impar  =  password + salt
par = salt + password
%5 = salt + password + salt


RandomBitIterator
sha256() = (binarysalt)hash


-------------------------------------------
ataque fuerza bruta
ataque de diccionario




min 16 
min 1 May
min 1 Numeri
min 1 simbolo 

NSA 32 

Autenticación de Doble Factor

mecanismo menor seguro de seguridad contraseña
TOPT
