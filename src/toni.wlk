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
	method moverALaDerecha() {
		self.position(self.position().right(1))
	}

	method moverALaIzquierda() {
		self.position(self.position().left(1))
	}

	method moverArriba() {
		self.position(self.position().up(1))
	}

	method moverAbajo() {
		self.position(self.position().down(1))
	}

	method agregarPlanta(planta) {
		plantasQueSembro.add(planta)
	}

	method regarLasPlantas() {
		plantasQueSembro.forEach({ i => i.regar()})
	}

	method plantasListasParaCosechar() {
		return plantasQueSembro.filter({ p => p.estaListaParaCosechar() })
	}

	method cosechar(planta) {
		plantasQueCosecho.add(planta)
		plantasQueSembro.remove(planta)
		game.removeVisual(planta)
	}

	method cosecharTodo() {
		self.plantasListasParaCosechar().forEach({ planta => self.cosechar(planta)})
	}

	method venderPlanta(planta) {
		monedas += planta.valor()
		plantasQueCosecho.remove(planta)
	}

	method venderCosecha() {
		plantasQueCosecho.forEach({ planta => self.venderPlanta(planta)})
	}

	method paraCuantosDiasLeAlcanza() {
		return (monedas + plantasQueCosecho.sum({ p => p.valor() })) / 200
	}

	method cuantoHayParaCeliacos() {
		return self.plantasListasParaCosechar().count({ p => not p.tieneGluten() })
	}

	method convieneRegar() {
		return plantasQueSembro.any({ p => not p.estaListaParaCosechar() })
	}

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

	method cantidadPlantasSembradas() {
		return plantasQueSembro.size()
	}

	method cantidadPlantasCosechadas() {
		return plantasQueCosecho.size()
	}

	method valorTotalDeMercaderiaParaVender() {
		return plantasQueCosecho.sum({ i => i.valor() })
	}

	method coordenadaX() {
		return position.x()
	}

	method coordenadaY() {
		return position.y()
	}

	method cambiarCoordenada(a, b) {
		position = game.at(a, b)
	}

	method venderPlantaAMercado(mercado) {
		// MODIFICAR: Hacer que solo pueda vender si está sobre en el mercado.
		/*Modificaciones hechas:
		 * 	- Parametro "mercado" agregado. Indica cual es el mercado en el cual se va a vender la planta.
		 * 	- Condicion de poder vender unicamente cuando Toni este parado sobre un mercado o tiene una planta para vender (sino tira el error).
		 */
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

