import wollok.game.*

class Maiz {

// se baso a que cada planta tiene una foto distinta dependiendo del riego
	var estadoDeHidratacion = 0

	
	
	method image() {
		// Modificar esto para que la imagen dependa del estado.
		/* 
		 * para compu tomy C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/maiz_bebe.png
		 * 
		 * maiz_bebe.png
		 */
		return "C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/maiz_bebe.png"
	}

	/* 
	 * comentario1: el ejercicio dice que se genera ganancia por la venta asique cada una debe tener una
	 *
	 * comentario2: los metodos de aca para abajo los podriamos hacer con herencia ya que son iguales para los 3 porq son plantas,
	 * 				sino no hace falta 
	 */ 
	method ganancia() {
		return 50
	}

	method regar() {
		estadoDeHidratacion += 10
	}

	method estadoDeHidratacion(){
		return estadoDeHidratacion
	}

}

// Agregar las demás plantas y completar el Maiz.
class Trigo {

	
	var estadoDeHidratacion = 0

	/* 
	 * tomy pc: C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/trigo_0.png 
	 * 
	 * en otro lado: trigo_0.png
	  */
	method image(){
		return "C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/trigo_0.png"
	}
	
	
	method ganancia() {
		return 150
	}

	method regar() {
		estadoDeHidratacion += 10
	}

	method estadoDeHidratacion(){
		return estadoDeHidratacion
	}
}

class Tomaco {

	
	
	var estadoDeHidratacion = 0

	/* 
	 * en pc tomy: C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/tomaco_ok.png
	 *
	 * en otra pc: tomaco_ok.png
	 */
	
	method image(){
		
		return "C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/tomaco_ok.png"
	}
	
	
	method ganancia() {
		return 80
	}

	method regar() {
		estadoDeHidratacion += 10
	}

	method estadoDeHidratacion(){
		return estadoDeHidratacion
	}
	
}

