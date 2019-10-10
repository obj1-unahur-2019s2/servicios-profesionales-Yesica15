import profesionales.*
import solicitante.*

class EmpresaServicio {
	var property empleados = []
	var property honorarioReferencia = 0
	var clientes = []
	
	method agregarEmpleados(emp) { empleados.add(emp) }
	
	method quitarEmpleados(emp) { empleados.remove(emp) }
	
	method provienenDeUniversidad(uni) = empleados.filter({emp => emp.universidad() == uni}).size()
	
	method profesionalesCaros() = empleados.filter({emp => emp.honorariosPorHora()>=honorarioReferencia})
	
	method universidadesFormadoras() = empleados.map({emp => emp.universidad()}).asSet()
	
	method profesionalMasBarato() = empleados.min({emp => emp.honorariosPorHora()})
	
	method esDeGenteAcotada() = empleados.all({emp => emp.provinciasDondePuedeTrabajar().size() <= 3})
	
	method satisfaceSolicitante(soli) = empleados.any({emp => soli.cumpleCondicion(emp)})
	
	method profesionalNecesario(soli) = empleados.find({emp => soli.cumpleCondicion(emp)})
	
	method darServicio(soli){
		if (self.satisfaceSolicitante(soli)){
			var prof = self.profesionalNecesario(soli)
			prof.cobrarImporte(prof.honorariosPorHora())
			clientes.add(soli)
		}
	}
	
	method cantClientes() = clientes.size()
	
	method tieneComoCliente(pers) = clientes.any({clien => clien == pers})
}
