object camion {
  var peso = 10

  var cosaATransportar = []
  
  method peso() = peso + tara.peso() 

  method cargarCosa(unaCosa){
    cosaATransportar.add(unaCosa)
  }
  method descargarUnaCosa(UnaCosa){
    if( not cosaATransportar.isEmpty() ){
      cosaATransportar.remove(UnaCosa)
    }
  }
  method pesoTotal(){
    var pesoDeLasCosasATransportar = cosaATransportar.sum({cosas => cosas.peso()})

    return pesoDeLasCosasATransportar + self.peso()
  }
  method pesoTotalEsPar() {
    return self.pesoTotal().even()
  }
  method hayAlgunaCosaQuePese(unValor) {
    return cosaATransportar.any({cosa => cosa.peso() == unValor})
  } 
  method controlDeNivelDePeligrosidad(valorDelNivel) {
    return cosaATransportar.findOrDefault({cosa => cosa.peso()}, valorDelNivel)
  }
  method listaDeCosasSuperiorDElNivelDePeligrosidad(valorDelNivel) {
    return cosaATransportar.filter({cosa => cosa.peso() > valorDelNivel})
  }
  //method
  method estaExcedidoDePeso() = self.pesoTotal() > 2500
  method puedeCircularEnRuta(pesoMaximoPermitido , nivelMaximoDePeligrosidad) {//bool
    return self.pesoTotal() > pesoMaximoPermitido && self.controlDeNivelDePeligrosidad(nivelMaximoDePeligrosidad)
  }
}
object tara {
  method peso() = 1000
}