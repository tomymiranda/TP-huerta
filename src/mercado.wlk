import wollok.game.*

class Mercado {

	var cantidadMonedas = 0
	const position
	var property mercaderia = []

	method image() = "mercado.png"

	method comprarMercaderia(planta) {
		mercaderia.add(planta)
	}

	method comprarMercaderiaEnCantidad(plantasEnCantidad) {
		mercaderia.addAll(plantasEnCantidad)
	}

	method position() = position

	method cantidadMonedas() = cantidadMonedas

	method nuevaCantidadMonedas(nuevaCantidad) {
		cantidadMonedas = nuevaCantidad
	}

}

