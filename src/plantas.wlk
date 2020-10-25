import wollok.game.*

//Puede crearse una super clase 'planta' para que las demas plantas hereden sus atributos.

class Plantas {
	method estaListaParaCosechar()
	method regar()
	method valor()
	method tieneGluten() = false
	method image()
}

class Maiz inherits Plantas {

// se baso a que cada planta tiene una foto distinta dependiendo del riego
	var property esBebe = true	
	
	override method image() {
		// Modificar esto para que la imagen dependa del estado.
		/* 
		 * para compu tomy C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/maiz_bebe.png
		 * 
		 * maiz_bebe.png
		 */
		return if(self.esBebe()){ "maiz_bebe.png" } else { "maiz_adulto.png" }
	}

	/* 
	 * comentario1: el ejercicio dice que se genera ganancia por la venta asique cada una debe tener una
	 *
	 * comentario2: los metodos de aca para abajo los podriamos hacer con herencia ya que son iguales para los 3 porq son plantas,
	 * 				sino no hace falta 
	 */ 
	override method regar() { esBebe = false }

	override method estaListaParaCosechar(){ return not esBebe }
	
	override method valor(){ return 150 }
}

// Agregar las demás plantas y completar el Maiz.
class Trigo inherits Plantas {
	
	var etapaDeEvolucion = 0
	var image = "trigo_0.png"
	/* 
	 * tomy pc: C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/trigo_0.png 
	 * 
	 * en otro lado: trigo_0.png
	*/
	
	override method image(){ return image }
		
	override method regar() {
		if(etapaDeEvolucion == 0 ){ etapaDeEvolucion += 1 ; image = "trigo_1.png" }
		else if(etapaDeEvolucion == 1 ){ etapaDeEvolucion += 1 ; image = "trigo_2.png" }
		else if(etapaDeEvolucion == 2 ){ etapaDeEvolucion += 1 ; image = "trigo_3.png" }
		else { etapaDeEvolucion = 0 ; image = "trigo_0.png" }
	}
	
	override method estaListaParaCosechar(){ return etapaDeEvolucion >= 2 }
	
	override method valor(){
		return if(etapaDeEvolucion == 2){ return 100 }
		else { return 200 }
	}
	
	override method tieneGluten(){ return true }
	
}



class Tomaco inherits Plantas {

	/* 
	 * en pc tomy: C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/tomaco_ok.png
	 *
	 * en otra pc: tomaco_ok.png
	 */
	override method regar(){}
	
	override method image(){ return "tomaco_ok.png" }
		
	override method estaListaParaCosechar(){ return true }
	
	override method valor(){ return 80 }
}

