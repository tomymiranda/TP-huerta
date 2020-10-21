import wollok.game.*

class Maiz {

	
	
	// se baso a que cada planta tiene una foto distinta dependiendo del riego
	var estadoDeHidratacion = 0

	method image() {
		// Modificar esto para que la imagen dependa del estado.
		return "maiz_bebe.png"
	}

	// el ejercicio dice que se genera ganancia por la venta asique cada una debe tener una
	method ganancia() {
		return 50
	}

	// aumenta la hidratacion en 10
	method hidratar() {
		estadoDeHidratacion += 10
	}

}

// Agregar las demás plantas y completar el Maiz.
class Tomaco {

	
	var estadoDeHidratacion = 0

	method ganancia() {
		return 150
	}

	method hidratar() {
		estadoDeHidratacion += 10
	}

}

class Trigo {

	
	var estadoDeHidratacion = 0

	method ganancia() {
		return 80
	}

	method hidratar() {
		estadoDeHidratacion += 10
	}

}

