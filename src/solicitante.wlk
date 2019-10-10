import profesionales.*

class Persona{
	var property provincia
	
	method cumpleCondicion(pro) = pro.provincia() == provincia
}

class Institucion{
	var property universidadesReconocidas = []
	
	method cumpleCondicion(pro) = universidadesReconocidas.any({uni => uni == pro.universidad()})
}