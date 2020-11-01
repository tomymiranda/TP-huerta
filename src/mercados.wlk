import toni.*
import wollok.game.*

class Mercado {

	const mercaderia = []
	var property cantidadDeMonedas = 50

	method comprarMercaderia() {
		mercaderia.addAll(toni.plantasQueCosecho())
		cantidadDeMonedas -= toni.valorTotalDeMercaderiaParaVender()
		toni.venderCosecha()
	}

	method cambiarCantidadDeMonedas(cantidad) {
		cantidadDeMonedas = cantidad
	}

}

