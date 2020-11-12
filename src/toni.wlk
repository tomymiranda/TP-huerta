import wollok.game.*
import plantas.*
import pachamama.*
import mercado.*

object toni {

	/*
	 * 
	 * 
	 * en otras pc: toni.png
	 */
	const property image = "toni.png"
	var property position = game.at(3, 3)
	var property monedas = 0
	var property plantasQueSembro = []
	var property plantasQueCosecho = []

	// Pegar acá todo lo que tenían de Toni en la etapa 1
	
	/*
	 * mueve a toni a la derecha
	 */
	method moverALaDerecha() {
		self.position(self.position().right(1))
	}

	/*
	 * mueve a toni a la izquierda
	 */
	method moverALaIzquierda() {
		self.position(self.position().left(1))
	}

	/*
	 * mueve a toni a arriba
	 */
	method moverArriba() {
		self.position(self.position().up(1))
	}
	
	/*
	 * mueve a toni a abajo
	 */
	method moverAbajo() {
		self.position(self.position().down(1))
	}

	/*
	 *agrega una planta a la lista plantasQueSembro
	 */
	method agregarPlanta(planta) {
		plantasQueSembro.add(planta)
	}

	/*
	 *riega las plantas que se encuentran en la lista plantasQueSembro
	 */
	method regarLasPlantas() {
		plantasQueSembro.forEach({ i => i.regar()})
	}

	/*
	 *retorna una coleccion con las plantas q estan listas para cosechgar
	 */
	 method plantasListasParaCosechar() {
		return plantasQueSembro.filter({ p => p.estaListaParaCosechar() })
	}

	/*
	 *mueve una planta de la lista plantasQueCosecho a la lista plantasQueSembro
	 */
	 method cosechar(planta) {
		plantasQueCosecho.add(planta)
		plantasQueSembro.remove(planta)
		game.removeVisual(planta)
	}

	/*
	 *mueve las planta de la lista plantasQueCosecho a la lista plantasQueSembro
	 */
	method cosecharTodo() {
		self.plantasListasParaCosechar().forEach({ planta => self.cosechar(planta)})
	}

	/*
	 *aumenta la cantidad de monedas en relacion al valor de la planta y la remueve de la lista plantasQueCosecho
	 */
	method venderPlanta(planta) {
		monedas += planta.valor()
		plantasQueCosecho.remove(planta)
	}

	/*
	 *aumenta la cantidad de monedas en relacion al valor de todas las planta de plantasQueCosecho y vacia la lista plantasQueCosecho
	 */
	method venderCosecha() {
		plantasQueCosecho.forEach({ planta => self.venderPlanta(planta)})
	}

	/*
	 * retorna la cantidad de dias en la que le rinde la cosecha a toni
	 */	
	method paraCuantosDiasLeAlcanza() {
		return (monedas + plantasQueCosecho.sum({ p => p.valor() })) / 200
	}

	/*
	 * retorna la cantidad de plantas que son aptas para celiacos
	 */
	method cuantoHayParaCeliacos() {
		return self.plantasListasParaCosechar().count({ p => not p.tieneGluten() })
	}

	/*retorna si es necesario regar */
	method convieneRegar() {
		return plantasQueSembro.any({ p => not p.estaListaParaCosechar() })
	}

	/*realiza una ofrenda a la pachamama */	
	method ofrecerOfrenda(planta) {
		const algunaPlanta = plantasQueSembro.anyOne()
		game.removeVisual(algunaPlanta)
		plantasQueSembro.remove(algunaPlanta)
		if (not pachamama.estaAgradecida()) {
			pachamama.agradecidaPorOfrenda()
		} else {
			self.regarLasPlantas()
		}
	}
	/*retorna la cantidad de plantas sembradas */
	method cantidadPlantasSembradas() {
		return plantasQueSembro.size()
	}
	/*retorna la cantidad de plantas cosechada */
	method cantidadPlantasCosechadas() {
		return plantasQueCosecho.size()
	}
	
	/*retorna la suma del valor total de las plantas que estan en plantasQueCosecho */
	method valorTotalDeMercaderiaParaVender() {
		return plantasQueCosecho.sum({ i => i.valor() })
	}
	/*retorna la coordena x de toni */	
	method coordenadaX() {
		return position.x()
	}
	/*retorna la coordena y de toni */	
	method coordenadaY() {
		return position.y()
	}
	/*retorna la coordena actual de toni */	
	method cambiarCoordenada(a, b) {
		position = game.at(a, b)
	}
	/*vende una planta al mercado */
	method venderPlantaAMercado(mercado) {
		if(self.cantidadPlantasCosechadas()>0){
			const planta = plantasQueCosecho.anyOne()
		}else{
			self.error("no hay plantas para vender")
		}
		
		if (mercado.cantidadMonedas() >= planta.valor()) {
			
			monedas += planta.valor()
			mercado.nuevaCantidadMonedas(mercado.cantidadMonedas() - planta.valor())
			mercado.comprarMercaderia(planta)
			plantasQueCosecho.remove(planta)
		} else {
			self.error("No estoy en el Mercado o no tengo ninguna planta para vender")
		}
	}
	/*vende toda la cosecha al mercado */	
	method venderCosechaAMercado(mercado) {
		if (self.cantidadPlantasCosechadas() > 0) {
			mercado.nuevaCantidadMonedas(self.valorTotalDeMercaderiaParaVender())
			mercado.comprarMercaderiaEnCantidad(self.plantasQueCosecho())
			plantasQueCosecho.removeAll(plantasQueCosecho)
		}else{
			self.error("no hay platas para vender")
		}
	}

}

