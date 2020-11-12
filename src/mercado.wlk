import wollok.game.*

class Mercado {

	var cantidadMonedas = 0
	const position
	var property mercaderia = []

	method image() = "mercado.png"

	/*agrega una mercaderia a la lista mercaderia*/	
	method comprarMercaderia(planta) {
		mercaderia.add(planta)
	}
	/*agrega una lista con plantas a la lista mercaderia */
	method comprarMercaderiaEnCantidad(plantasEnCantidad) {
		mercaderia.addAll(plantasEnCantidad)
	}
	/*retorna la posicion del mercado */
	method position() = position

	/*retorna la catidad de monedas del mercado */
	method cantidadMonedas() = cantidadMonedas

	/*cambia la cantidad de monedas que tiene el mercado */
	method nuevaCantidadMonedas(nuevaCantidad) {
		cantidadMonedas = nuevaCantidad
	}

}

