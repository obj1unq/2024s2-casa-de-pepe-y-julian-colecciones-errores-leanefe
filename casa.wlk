import cosas.* 
import cuentas.*

object casaDePepeYJulian {
	const cosas = []
	var property cuenta = cuentaCorriente

	method comprar(cosa) {
		cuenta.extraer(cosa.precio())
		cosas.add(cosa)
	}

	method cosas() {
		return cosas //Hecho para el test
	}

	method cantidadDeCosasCompradas() {
		return cosas.size()	
	}

	method tieneAlgun(categoria) {
		return cosas.any({cosa => cosa.esMismaCategoria(categoria)})
	}

	method vieneDeComprar(categoria) {
		return cosas.isEmpty() and cosas.last().esMismaCategoria(categoria)
	}

	method esDerrochona() {
		return self.importeTotal() >= 9000
	}

	method importeTotal() {
		return cosas.sum({cosa => cosa.precio()})
	}

	method compraMasCara() {
		return cosas.max({cosa => cosa.precio()})
	}

	method comprados(categoria) {
		return cosas.filter({cosa => cosa.esMismaCategoria(categoria)})
	}

	method malaEpoca() {
		return cosas.all({cosa => cosa.esMismaCategoria(comida)})
	}

	method queFaltaComprar(lista) {
		return lista.filter({cosa => not self.fueComprada(cosa)})
	}

	method fueComprada(cosa) {
		return cosas.contains(cosa)
	}

	method faltaComida() {
		return self.cantidadDeCosasCompradas(comida) < 2
	}

	method cantidadDeCosasCompradas(categoria) {
		return cosas.count({cosa => cosa.esMismaCategoria(categoria)})
	}

	method categoriasCompradas() {
		return cosas.map({cosa => cosa.categoria()}).withoutDuplicates()
	}
}
