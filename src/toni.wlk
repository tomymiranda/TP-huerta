import wollok.game.*

object toni {
	
	/*
	 * para que levante la imagen en compu tomy: C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/toni.png 
	 * 
	 * en otras pc: toni.png
	 */
	const property image = "C:/Users/Usuario/Desktop/Unahur/PO1/git/TP-huerta/assets/toni.png"
	var property position = game.at(3, 3)
	var property monedas = 0
	
	const plantasQueSembro = []
	
	// Pegar acá todo lo que tenían de Toni en la etapa 1

	method moverALaDerecha(){
		self.position(self.position().right(1))
	}

	method moverALaIzquierda(){
		self.position(self.position().left(1))
	}

	method moverArriba(){
		self.position(self.position().up(1))
	}

	method moverAbajo(){
		self.position(self.position().down(1))
	}
	
	method agregarPlanta(planta){
		plantasQueSembro.add(planta)
	}

	method regarTodas(){
		plantasQueSembro.forEach({ i => i.hidratar()})
	}

}