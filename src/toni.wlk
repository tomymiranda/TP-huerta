import wollok.game.*
import plantas.*

object toni {
	
	/*
	 * 
	 * 
	 * en otras pc: toni.png
	 */
	const property image = "toni.png"
	var property position = game.at(3, 3)
	var property monedas = 0
	
	const property plantasQueSembro = []
	const property plantasQueCosecho = []
	
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

	method regarLasPlantas(){
		plantasQueSembro.forEach({ i => i.regar()})
	}
	
	method plantasListasParaCosechar(){
		return plantasQueSembro.filter( { p => p.estaListaParaCosechar() } )
	}
	
	method cosechar(planta){
		plantasQueCosecho.add(planta)
		plantasQueSembro.remove(planta)
		game.removeVisual(planta)
	}
	
	method cosecharTodo(){
		self.plantasListasParaCosechar().forEach( { planta => self.cosechar(planta) } )
	}
	
	method venderPlanta(planta){
		monedas += planta.valor()
		plantasQueCosecho.remove(planta)
	}
	
	method venderCosecha(){
		plantasQueCosecho.forEach( { planta => self.venderPlanta(planta) } )
	}
	method paraCuantosDiasLeAlcanza(){
		return (monedas + plantasQueCosecho.sum( { p => p.valor() } )) / 200
	}
	method cuantoHayParaCeliacos(){
		return self.plantasListasParaCosechar().count( { p => not p.tieneGluten() } )
	}
	
	method convieneRegar(){
		return plantasQueSembro.any( { p => not p.estaListaParaCosechar() } )
	}

}