import wollok.game.*
import toni.*

object pachamama {

	var nivelAgradecimiento = 10

	method image() {
		if (self.estaAgradecida()) {
			return "pachamama-agradecida.png"
		} else {
			return "pachamama-noagradecida.png"
		}
	}

	method llover() {
		nivelAgradecimiento += 5
	} 

	method fumigar() {
		nivelAgradecimiento = 0
	}

	method estaAgradecida() {
		return nivelAgradecimiento >= 10
	}

	/*method ofrecerOfrenda(){  toni.borrar() }*/
	method agradecidaPorOfrenda() {
		nivelAgradecimiento = 10
	}

}

