(deffacts linea
    (lineaPedido palet naranjas 0 palet manzanas almacen palet naranjas 10 palet manzanas 2)
    (pedido palet naranjas 4 palet manzanas 2)
    (transporte 3)
)

(defrule mover_unPoco

    (lineaPedido $?preLinea palet ?fruta ?frutaLinea $?postLinea almacen $?preA palet ?fruta ?frutaA $?postA)
    (pedido $?preP palet ?fruta ?frutaP $?postP)
    (transporte ?numeroTransporte)
    (test (>(+ ?frutaLinea ?frutaA) ?frutaP))
    (test (> ?numeroTransporte ?frutaP))
    (test (<> ?frutaLinea ?frutaP))
    =>
    (assert(lineaPedido $?preLinea palet ?fruta (+ ?frutaLinea ?frutaP) $?postLinea almacen $?preA palet ?fruta (- ?frutaA ?frutaP) $?postA))
)