import wollok.game.*
import pachamama.*

class Plantas {

	var property madrePacha = pachamama

	/*retorna si esta lista para cosechar */	
	method estaListaParaCosechar()
	/*riega la planta */
	method regar()
	/*retorna el valor de la planta */
	method valor()
	/*retorna si tiene gluten */
	method tieneGluten() = false
	/*retorna la imagen */	
	method image()

}

class Maiz inherits Plantas {

	var property esBebe = true

	override method image() {
		return if (self.esBebe()) {
			"maiz_bebe.png"
		} else {
			"maiz_adulto.png"
		}
	}

	override method regar() {
		esBebe = false
	}

	override method estaListaParaCosechar() {
		return not esBebe
	}

	override method valor() {
		return if (madrePacha.estaAgradecida()) {
			180
		} else {
			150
		}
	}

}

class Trigo inherits Plantas {

	var etapaDeEvolucion = 0

	override method image() {
		if (etapaDeEvolucion == 0) {
			return "trigo_0.png"
		} else if (etapaDeEvolucion == 1) {
			return "trigo_1.png"
		} else if (etapaDeEvolucion == 2) {
			return "trigo_2.png"
		} else {
			return "trigo_3.png"
		}
	}

	override method regar() {
		if (madrePacha.estaAgradecida()) {
			etapaDeEvolucion += 2
		} else {
			etapaDeEvolucion += 1
		}
		if (etapaDeEvolucion > 3) {
			etapaDeEvolucion = 0
		}
	}

	override method estaListaParaCosechar() {
		return etapaDeEvolucion >= 2
	}

	override method valor() {
		if (etapaDeEvolucion == 2) {
			return 100
		} else {
			return 200
		}
	}

	override method tieneGluten() {
		return true
	}

}

class Tomaco inherits Plantas {

	override method regar() {
	}

	override method image() {
		return if (madrePacha.estaAgradecida()) "tomaco_podrido.png" else {
			"tomaco_ok.png"
		}
	}

	override method estaListaParaCosechar() {
		return madrePacha.estaAgradecida()
	}

	override method valor() {
		return 80
	}

}

