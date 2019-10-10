// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrarImporte(importe) { asociacionProfesionalesLitorarl.depositar(importe)}
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return {universidad.provincia()} }
	
	method honorariosPorHora() { return universidad.remuneracionRecomendada() }
	
	method cobrarImporte(importe) { universidad.recibirDonacion(importe/2)}
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad
	var property provinciasDondePuedeTrabajar = []
	var property honorariosPorHora
	var recaudacion = 0
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method cobrarImporte(importe) {recaudacion += importe}
	method pasarDinero(prof, importe) {
		if (importe >= recaudacion){
			prof.cobrarImporte(recaudacion)
		}
		else{ prof.cobrarImporte(importe)}
		recaudacion = 0.max(recaudacion - importe)
	}
	
}

// extras
class Universidad{
	var property provincia
	var property remuneracionRecomendada
	var donaciones = 0
	
	method recibirDonacion(importe) {donaciones += importe}
	method donaciones() = donaciones
}

object asociacionProfesionalesLitorarl{
	var recaudacion = 0
	
	method depositar(importe) { recaudacion += importe}
	method recaudacion() = recaudacion
}
