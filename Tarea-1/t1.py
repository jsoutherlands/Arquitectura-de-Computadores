import re

def baseOCodigo(base):
	if re.fullmatch(r"bcd|gry|ed3|jsn|par|pbt|ham", base):
		return 0
	elif re.fullmatch(r"[1-9][0-9]*", base):
		return 1
	else:
		return -1

def validadorBase(numeroInicio, baseInicio):
	valores = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+?"
	if baseInicio == "1":
		for x in numeroInicio:
			if x != "1":
				return False
		return True
	valoresBase = valores[0:int(baseInicio)]
	for x in range(len(numeroInicio)):
		if numeroInicio[x] not in valoresBase:
			return False
	return True

def esBinario(numeroInicio):
	if re.fullmatch(r"[0-1]*", numeroInicio):
		return True
	else:
		return False

'''def esBinarioODecimal(numeroInicio):
	if re.fullmatch(r"0[0-1]*", numeroInicio):
		return numeroInicio[1:]
	elif re.fullmatch(r"[1-9][0-9]*", numeroInicio):
		return baseABase(n, "10", "2")
	else:
		return "-"
'''

def baseABase(numeroInicio, baseInicio, baseObjetivo):
	valores = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+?"
	sumatoria = 0
	string = ""
	division = 0
	cociente = 0
	for posicion in range(len(numeroInicio)):
		sumatoria += valores.find(numeroInicio[posicion])*(int(baseInicio)**(len(numeroInicio)-posicion-1))
	if baseObjetivo == "1":
		string = "1" * int(numeroInicio)
		return string
	while(sumatoria > 0):
		division = sumatoria // int(baseObjetivo)
		cociente = sumatoria % int(baseObjetivo)
		string = valores[cociente] + string
		sumatoria = division
	if string == "":
		return "0"
	return string

def bcd(numeroInicio):
	BCD = ["0000","0001","0010","0011","0100","0101","0110","0111","1000","1001"]
	string = ""
	if esBinario(numeroInicio):
		while (len(numeroInicio)%4 != 0):
			numeroInicio = "0" + numeroInicio
		while len(numeroInicio)!=0:
			for x in range(len(BCD)):
				if BCD[x] == numeroInicio[0:4]:
					string += str(x)
					numeroInicio = numeroInicio[4:]
		return string
	else:
		for x in numeroInicio:
			string += BCD[int(x)]
		return string

def gry(numeroInicio):
	string = ""
	for x in range(len(numeroInicio)):
		if x == 0:
			string += numeroInicio[x]
		elif x > 0 and x <= len(numeroInicio):
			if numeroInicio[x] != numeroInicio[x-1]:
				string += "1"
			else:
				string += "0"
	return string

def ed3(numeroInicio):
	BCD = ["0000","0001","0010","0011","0100","0101","0110","0111","1000","1001"]
	ED3 = ["0011","0100","0101","0110","0111","1000","1001","1010","1011","1100"]
	string = ""
	if esBinario(numeroInicio):
		while len(numeroInicio)%4 != 0:
			numeroInicio = "0" + numeroInicio
		while len(numeroInicio) != 0:
			for x in range(len(BCD)):
				if BCD[x] == numeroInicio[0:4]:
					string += str(x+3)
					numeroInicio = numeroInicio[4:]
		return string
	else:
		for x in numeroInicio:
			string += ED3[int(x)]
		return string

def jsn(numeroInicio):
	numeroInicio = baseABase(numeroInicio,"2","10")
	string = ""
	x = 0
	n = 1
	while (2*n)-1 < int(numeroInicio):
		n+=1
	if n > int(numeroInicio):
		x = (2*n) - int(numeroInicio)
		string += "0" * x
		while len(string) < n:
			string += "1"
	else:
		x = (2*n) - int(numeroInicio)
		string += "1" * x
		while len(string) < n:
			string += "0"
	return string

def par(numeroInicio):
	if len(re.findall(r"1", numeroInicio)) % 2 == 0:
		return "1"
	else:
		return "0"

def pbt(numeroInicio):
	if len(numeroInicio)%5 == 0:
		while len(numeroInicio)!=0:
			if len(re.findall(r"1", numeroInicio[0:5])) !=2:
				return "0"
			numeroInicio = numeroInicio[5:]
		return "1"
	else:
		return "0"

'''
def ham(numeroInicio):
	n=0
	vetados = []
	vetados2 = []
	while (2**n)<= (len(numeroInicio)+n):
		vetados.append(2**n)
		vetados2.append([2**n])
		n+=1
	lista = [None] * (len(numeroInicio) + n)
	posicion = 0
	for x in numeroInicio:
		while (posicion+1) in vetados:
			posicion+=1
		lista[posicion] = x
		posicion+=1
	return lista
'''

def transformar(numeroInicio, codigo):
	if codigo == "bcd":
		numeroInicio = baseABase(numeroInicio, "2", "10")
		return bcd(numeroInicio)
	elif codigo == "gry":
		return gry(numeroInicio)
	elif codigo == "ed3":
		numeroInicio = baseABase(numeroInicio, "2", "10")
		return ed3(numeroInicio)
	elif codigo == "jsn":
		return jsn(numeroInicio)
	elif codigo == "par":
		return par(numeroInicio)
	elif codigo == "pbt":
		return pbt(numeroInicio)
	elif codigo == "ham":
		return ham(numeroInicio)

#print(ham("010110101011"))

lectura = str(input())
while(lectura != "-"):
	lectura = lectura.split()
	if len(lectura) == 3:
		n = lectura[0]
		b = lectura[1]
		t = lectura[2]
		if baseOCodigo(b) == 1 and baseOCodigo(t) == 1: #inicial base objetivo base
			if validadorBase(n,b) and int(baseABase(n,b,"10")) <= 1000: #comprueba base y menor a 1000 decimal
				print("Base {}: {}".format(t,baseABase(n,b,t)))
			else:
				print("Entrada invalida")
		elif baseOCodigo(b) == 0 and baseOCodigo(t) == 1 and esBinario(n): #CODIGO A BASE
				if int(baseABase(n,"2","10")) <= 1000:
					if b == "bcd":
						n = bcd(n)
						n = baseABase(n, "10", t)
						print("Base {}: {}".format(t,n))
					elif b == "gry":
						n = gry(n)
						n = baseABase(n, "2", t)
						print("Base {}: {}".format(t,n))
					elif b == "ed3":
						n = ed3(n)
						n = baseABase(n, "10", t)
						print("Base {}: {}".format(t,n))
					elif b == "jsn":
						n = jsn(n)
						n = baseABase(n, "2", t)
						print("Base {}: {}".format(t,n))
					elif b == "par":
						n = par(n)
						n = baseABase(n, "2", t)
						print("Base {}: {}".format(t,n))
					elif b == "pbt":
						n = pbt(n)
						n = baseABase(n, "2", t)
						print("Base {}: {}".format(t,n))
					else:
						print("Entrada invalida")
				else:
					print("Entrada invalida")
		elif baseOCodigo(b) == 1 and baseOCodigo(t) == 0: #BASE A CODIGO
			if validadorBase(n, b) and int(baseABase(n,b,"10")) <= 1000: #comprueba base y
				if t == "bcd": #comprueba codigo
					n = baseABase(n, b, "10")
					n = bcd(n)
					n = baseABase(n, "2", "2")
					print("Código BCD: " + n)
				elif t == "gry":
					n = baseABase(n,b,"2")
					n = gry(n)
					print("Código Gray: " + n)
				elif t == "ed3":
					n = baseABase(n, b, "10")
					n = ed3(n)
					n = baseABase(n, "2", "2")
					print("Código Exceso de 3: " + n)
				elif t == "jsn":
					n = baseABase(n, b, "2")
					n = jsn(n)
					print("Código Johnson: " + n)
				elif t == "par":
					n = baseABase(n,b,"2")
					n = par(n)
					print("Codigo Paridad: " + n)
				elif t == "pbt":
					n = baseABase(n, b, "2")
					n = pbt(n)
					print("Código Pentabit: " + n)
				else:
					print("Entrada invalida")
		elif baseOCodigo(b) == 0 and baseOCodigo(t) == 0 and esBinario(n):
			if int(baseABase(n,"2","10")) <= 1000:
				if t == "bcd":
					print("Codigo BCD: " + transformar(transformar(n,b),t))
				elif t == "gry":
					print("Codigo Gray: " + transformar(transformar(n,b),t))
				elif t == "ed3":
					print("Codigo Exceso de 3: " + transformar(transformar(n,b),t))
				elif t == "jsn":
					print("Codigo Johnson: " + transformar(transformar(n,b),t))
				elif t == "par":
					print("Codigo Paridad: " + transformar(transformar(n,b),t))
				elif t == "pbt":
					print("Codigo PentaBit: " + transformar(transformar(n,b),t))
				elif t == "ham":
					print("Codigo Hamming: " + transformar(transformar(n,b),t))
				else:
					print("Entrada invalida")
			else:
				print("Entrada invalida")
		else:
			print("Entrada invalida")
	else:
		print("Entrada invalida")
	lectura = input()
